from flask import Flask, request, jsonify, render_template
import google.generativeai as genai
import requests
import json
import re

import os
import google.generativeai as genai

# Configure Gemini AI using environment variable
genai.configure(api_key=os.getenv("GEMINI_API_KEY"))

# Google Custom Search API Credentials from environment variables
GOOGLE_SEARCH_API_KEY = os.getenv("GOOGLE_SEARCH_API_KEY")
GOOGLE_SEARCH_CX = os.getenv("GOOGLE_SEARCH_CX")


app = Flask(__name__)

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

# HTML route (optional)
@app.route("/det")
def det():
    return render_template("det.html")

if __name__ == "__main__":
    app.run(debug=True)
