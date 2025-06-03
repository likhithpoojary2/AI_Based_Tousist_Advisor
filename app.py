from flask import Flask, render_template,request,session,redirect,jsonify
import pandas as pd
import mysql.connector
from hashlib import sha256
from flask import render_template, request, redirect, url_for
import requests
from flask_cors import CORS
import datetime
from content_recomendation import recommend_similar
import google.generativeai as genai
import json
import re
from popularity_recommendation import get_popularity_recommendations
from datetime import timedelta

from collab_filtering import RecommendationSystem
from dotenv import load_dotenv
import os

load_dotenv()


app = Flask(__name__)
CORS(app)



app.secret_key = os.getenv("FLASK_SECRET_KEY")

genai.configure(api_key=os.getenv("GEMINI_API_KEY"))

GOOGLE_SEARCH_API_KEY = os.getenv("GOOGLE_SEARCH_API_KEY")
GOOGLE_SEARCH_CX = os.getenv("GOOGLE_SEARCH_CX")

db_config = {
    'host': os.getenv("DB_HOST"),
    'user': os.getenv("DB_USER"),
    'password': os.getenv("DB_PASSWORD"),
    'database': os.getenv("DB_NAME"),
}




rec_sys = RecommendationSystem()


def get_db_connection():
    return mysql.connector.connect(**db_config)


def hash_password(password):
    return sha256(password.encode()).hexdigest()



def get_top_recommendations():
    db =get_db_connection()
    query = """
    SELECT uc.user_id, uc.destination_id, d.name, d.weatherType, d.price,d.imageUrl,d.nights,d.slug
    FROM user_clicks uc
    JOIN destinations d ON uc.destination_id = d.id;
    """

    df = pd.read_sql(query, db)
    db.close()

    top_destinations = df['destination_id'].value_counts().head(5).reset_index()
    top_destinations.columns = ['destination_id', 'click_count']

    recommended_destinations = pd.merge(
        top_destinations, 
        df[['destination_id', 'name', 'weatherType', 'price','imageUrl','nights','slug']].drop_duplicates(),
        on='destination_id', 
        how='left'
    )

    return recommended_destinations.to_dict(orient="records")



# Function to fetch real images from Google Custom Search
def fetch_real_images(query, num_images=2):
    url = "https://www.googleapis.com/customsearch/v1"
    params = {
        "q": query,
        "cx": GOOGLE_SEARCH_CX,
        "key": GOOGLE_SEARCH_API_KEY,
        "searchType": "image",
        "num": num_images  # Number of images to fetch
    }
    
    response = requests.get(url, params=params)
    data = response.json()
    
    if "items" in data:
        return [item["link"] for item in data["items"]]
    return []



# Function to generate destination details (without example images)
def generate_destination_data(destination_name):
    prompt = f"""
    Provide a JSON response with details for {destination_name}:
    {{
      "overview": "Brief description of the destination",
      "places_to_visit": [
        {{
          "place_name": "Name of the place",
          "place_description": "Description of the place"
        }}
      ],
      "accommodations": [
        {{
          "accommodation_name": "Name of the hotel or tent",
          "type": "hotel or tent"
        }}
      ]
    }}
    Do NOT include any images or extra text outside JSON.
    """

    model = genai.GenerativeModel("gemini-1.5-flash-latest")
    response = model.generate_content(prompt)

    # Extract and clean JSON response
    response_text = response.candidates[0].content.parts[0].text.strip()
    json_text = re.sub(r"^```json|```$", "", response_text).strip()

    try:
        return json.loads(json_text)
    except json.JSONDecodeError as e:
        return {"error": f"Invalid JSON: {e}"}


@app.route("/")
def index():
    if 'user_id' not in session:
        return redirect('/login')
    
    recommendations = get_top_recommendations()
    rec_sys._load_data()
    collab = rec_sys.recommend_for_user(session['user_id'])
    print(session['user_id'])
    
    print(collab)  # Debugging statement (optional)

    return render_template("index.html", recommendations=recommendations, collab=collab)  # Added collab to template


@app.route('/about', methods=['GET'])
def about():
    return render_template('about.html')

@app.route('/contact', methods=['GET'])
def contact():
    return render_template('contact.html')









# for all destination and filtering
def get_user_city():
    return "mangalore"

def fetch_destinations(origin_city):
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        
        cursor.execute("SELECT id,name, price, weatherType,imageUrl,slug,nights FROM destinations")
        destinations = cursor.fetchall()
    
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        destinations = []
    
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()
    
    return destinations

def filter_by_budget(destinations, user_budget):
    return [dest for dest in destinations if dest["price"] <= user_budget]

def filter_by_weather(destinations, preferred_weather):
    if not preferred_weather:
        return destinations  # If no preference is selected, return all destinations
    
    filtered_destinations = []
    
    for dest in destinations:
        weather_types = [w.strip().lower() for w in dest["weatherType"].split(",")]  # Convert to list
        if any(w in weather_types for w in preferred_weather):
            filtered_destinations.append(dest)

    return filtered_destinations

@app.route('/destination', methods=['GET', 'POST'])
def destination():
    if "user_id" not in session:
        return redirect('/login')

    origin_city = get_user_city()
    destinations = fetch_destinations(origin_city)

    if request.method == 'POST':
        selected_location = request.form.get("location")
        user_budget = request.form.get("budget", type=int)
        preferred_weather = [w.lower() for w in request.form.getlist("weather")]
      
    

        # Filter by location
        if selected_location:
            destinations = [
                dest for dest in destinations
                if dest["slug"].lower().replace(" ", "-") == selected_location.lower()
            ]


        # Filter by budget
        if user_budget:
            destinations = filter_by_budget(destinations, user_budget)


        # Filter by weather
        if preferred_weather:
            destinations = filter_by_weather(destinations, preferred_weather)
        print(destinations)

        # Filter by nights


    
        print(destinations)

    return render_template("destination.html",
                           origin_city=origin_city,
                           destinations=destinations)





# API endpoint to get destination details with real images
@app.route("/get_destination", methods=["GET"])
def get_destination():
    destination_name = request.args.get("name")
    if not destination_name:
        return jsonify({"error": "Please provide a destination name."}), 400

    data = generate_destination_data(destination_name)

    # Fetch real images for the destination
    destination_images = fetch_real_images(destination_name)
    data["images"] = destination_images if destination_images else ["No images found"]

    # Fetch real images for places to visit
    for place in data.get("places_to_visit", []):
        place_images = fetch_real_images(place["place_name"])
        place["image_url"] = place_images[0] if place_images else "No image found"

    # Fetch real images for accommodations
    for acc in data.get("accommodations", []):
        acc_images = fetch_real_images(acc["accommodation_name"])
        acc["image_url"] = acc_images[0] if acc_images else "No image found"

    return jsonify(data)

# New Route: Fetch Destination Details from Database
@app.route('/destination-details')
def destination_details():
    dest_id = request.args.get("dest_id")

    if not dest_id:
        return "Destination ID missing", 400

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Fetch destination details from the database
    cursor.execute("SELECT * FROM destinations WHERE id = %s", (dest_id,))
    destination = cursor.fetchone()

    cursor.close()
    conn.close()

    if not destination:
        return "Destination not found", 404

    destination_name = destination.get("name")  # Assuming your table has a 'name' column

    # Get additional AI-generated details and images
    ai_data = generate_destination_data(destination_name)

    # Fetch real images from Google Custom Search
    destination_images = fetch_real_images(destination_name)
    ai_data["images"] = destination_images if destination_images else ["No images found"]

    # Fetch images for places to visit
    for place in ai_data.get("places_to_visit", []):
        place_images = fetch_real_images(place["place_name"])
        place["image_url"] = place_images[0] if place_images else "No image found"

    # Fetch images for accommodations
    for acc in ai_data.get("accommodations", []):
        acc_images = fetch_real_images(acc["accommodation_name"])
        acc["image_url"] = acc_images[0] if acc_images else "No image found"

    # Render the template with database details + AI-generated data
    return render_template("destination-details.html", destination=destination, ai_data=ai_data)





@app.route('/save_click', methods=['POST'])
def save_click():
    data = request.json
    destination_id = data.get("destination_id")
    user_id = session.get("user_id", None)  # Handles guest users

    if not destination_id:
        return jsonify({"status": "error", "message": "No destination ID provided"}), 400

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO user_clicks (user_id, destination_id) VALUES (%s, %s)", 
        (user_id, destination_id)
    )
    conn.commit()
    cursor.close()

    # Instead of redirecting, send a JSON response
    return jsonify({"status": "success", "redirect_url": url_for('destination_details', dest_id=destination_id)})






# Get all clicks for recommendations
@app.route('/get_clicks', methods=['GET'])
def get_clicks():
    conn=get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM user_clicks ORDER BY timestamp DESC LIMIT 10")
    clicks = cursor.fetchall()
    cursor.close()
    
    data = [{"id": row[0], "user_id": row[1], "destination": row[2], "timestamp": row[3]} for row in clicks]
    return jsonify(data)









# travel data
# Function to fetch travel data
def fetch_travel_data(api_url):
    response = requests.get(api_url)
    if response.status_code == 200:
        try:
            return response.json()
        except ValueError:
            return {"error": "Invalid JSON response from API"}
    return {"error": "Failed to fetch data"}


def fetch_route_travel_data(api_url):
    try:
        response = requests.get(api_url)
        if response.status_code == 200:
            return response.json()
        else:
            return {"error": "Failed to fetch data from API"}
    except Exception as e:
        return {"error": str(e)}

def format_duration(seconds):
    try:
        return str(timedelta(seconds=seconds))
    except:
        return "N/A"

@app.route('/travel-data', methods=['GET'])
def travel_data():
    place_name = request.args.get('place')

    if not place_name:
        return jsonify({"error": "Place name is required"}), 400
    print(place_name)

    formatted_place = place_name.lower().replace(", ", "-").replace(",", "-").replace(" ", "-")
    print(formatted_place)
    api_url = f"https://www.ixigo.com/plan/api/v2/distance-fast/bengaluru-karnataka-india/{formatted_place}"
    
    data = fetch_route_travel_data(api_url)

    if "error" in data:
        return jsonify(data), 500

    processed_data = []

    for route in data:
        if not isinstance(route, dict):
            continue

        travel_info = {
            "route": route.get("routeName", "Unknown"),
            "duration": format_duration(route.get("duration", 0)),
            "total_distance": route.get("totalDistance", "N/A"),
            "price_range": {
                "currency": route.get("currencyCode", "INR"),
                "low": route.get("priceLow", "N/A"),
                "high": route.get("priceHigh", "N/A")
            },
            "booking_url": route.get("url", "N/A"),
            "segments": []
        }

        for segment in route.get("filteredPlaces", []):
            if not isinstance(segment, dict):
                continue

            origin = segment.get("origin", {})
            destination = segment.get("destination", {})
            segment_price = segment.get("segmentPrice", {})

            travel_info["segments"].append({
                "origin": {
                    "name": origin.get("shortName", "Unknown"),
                    "latitude": origin.get("lat"),
                    "longitude": origin.get("lng")
                },
                "destination": {
                    "name": destination.get("shortName", "Unknown"),
                    "latitude": destination.get("lat"),
                    "longitude": destination.get("lng")
                },
                "price": {
                    "currency": segment_price.get("currencyCode", "INR"),
                    "amount": segment_price.get("price", "N/A")
                },
                "duration": format_duration(segment.get("duration", 0)),
                "booking_url": segment.get("url", "N/A")
            })

        processed_data.append(travel_info)

    return render_template("travels.html", travel_data=processed_data, place=place_name)



@app.route("/travel")
def travel():
    return render_template('travels.html')




@app.route('/map')
def map_view():
    try:
        dest_lat = float(request.args.get('dest_lat'))
        dest_lng = float(request.args.get('dest_lng'))
        dest_name = request.args.get('dest_name')

        return render_template('map_view.html',
                               dest_lat=dest_lat,
                               dest_lng=dest_lng,
                               dest_name=dest_name)
    except Exception as e:
        return f"Error: {e}"




#1. content based recomendation
@app.route("/content")
def content():
    return render_template('content.html')



@app.route('/content-recommend', methods=['GET'])
def get_recommendations():
    dest_id = request.args.get('dest_id', type=int)
    if not dest_id:
        return jsonify({"error": "Please provide a valid destination ID."}), 400
    
    recommendations = recommend_similar(dest_id)
    print(recommendations)
    if isinstance(recommendations, str):
        return jsonify({"error": recommendations}), 400
    
    return jsonify({"recommendations": recommendations})




# popularity based recommendation
@app.route('/popularity', methods=['GET'])
def recommendations():
    try:
        data = get_popularity_recommendations()
        return render_template("popularity.html", destinations=data)
    except Exception as e:
        return render_template("popularity.html", error=str(e))
    

@app.route('/api/recommendations/<int:user_id>', methods=['GET'])
def collab_recommendations(user_id):
    try:
        recommendations = rec_sys.recommend_for_user(user_id)
        return jsonify({"status": "success", "recommendations": recommendations})
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500



@app.route("/login", methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        # Check user credentials
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)
        query = "SELECT * FROM user WHERE email = %s"
        cursor.execute(query, (email,))
        user = cursor.fetchone()

        # If the user exists
        if user:
            # Check if the password is correct
            hashed_password = hash_password(password)
            if hashed_password == user['password']:
                session['user_id'] = user['u_id']  # Store user ID in session
                
                session['username'] = user['uname']   # Store username in session
                session['uemail']=user['email']
               
                # Redirect to dashboard based on role
                
                    # Get total file count and last login details
                  
                return render_template('index.html', response="Login Success.")
            else:
                return render_template('login.html', error="Invalid email or password. Please try again.")
             

        else:
            return render_template('login.html', error="Invalid email or password. Please try again.")

    return render_template('login.html')




@app.route("/register", methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['name']
        email = request.form['email']
        password = request.form['password']

        # Create a new user
        connection = get_db_connection()
        cursor = connection.cursor()
        query = "SELECT * FROM user WHERE email = %s"
        cursor.execute(query, (email,))
        existing_user = cursor.fetchone()
        if existing_user:
            connection.close()
            return render_template('login.html',error="Email address already exists. Please choose a different one.")
            

        # Encrypt password
        hashed_password = hash_password(password)
        query = "INSERT INTO user (uname, email, password) VALUES (%s, %s, %s)"
        cursor.execute(query, (username, email, hashed_password))
        connection.commit()
        
        connection.close()
        

        return render_template('login.html',response="registration Successfull")  # Redirect to login page after successful registration

    return render_template('login.html')



@app.route("/logout")
def logout():
    # Clear user-related data from session
    
    session.pop('user_id', None)
   
    return render_template('login.html',response='logout succesfull')






if __name__ == '__main__':
    app.run(debug=True)
