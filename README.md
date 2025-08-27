# AI-Based Tourist Advisor

AI-Based Tourist Advisor is an intelligent travel recommendation system that uses machine learning and generative AI to help users discover personalized travel destinations. It combines collaborative filtering, content-based filtering, and popularity-based suggestions with real-time images and AI-generated content to enhance the user experience.

---

## Features

* Personalized Recommendations

  * Collaborative filtering using SVD
  * Content-based filtering with TF-IDF + Cosine Similarity
  * Popularity-based destination ranking

* AI-Powered Travel Content

  * Gemini AI (Google Generative AI) generates destination overviews, nearby attractions, and accommodation options

* Real-Time Image Fetching

  * Google Custom Search API displays actual destination images

* Intelligent Filtering Options

  * Filter by budget, location, and weather preferences

* User Behavior Tracking

  * Tracks destination clicks to evolve recommendations

* Destination Details

  * Includes AI-generated overviews
  * Lists nearby places to visit
  * Displays accommodation options (hotels, tents)
  * Provides routing guides with options for bus, train, taxi, and flight travel
  * Suggests booking links for flights and hotels

* User Authentication

  * Login and registration system using MySQL

* Beautiful Frontend

  * Responsive UI built with HTML, CSS, Bootstrap
  * Interactive pages rendered using Jinja2 templates
  * Clean layout with intuitive navigation and dynamic sections

---

## Tech Stack

| Layer     | Technology                          |
| --------- | ----------------------------------- |
| Frontend  | HTML, Bootstrap, Jinja2             |
| Backend   | Python, Flask                       |
| Database  | MySQL                               |
| ML Models | scikit-learn, scikit-surprise       |
| AI APIs   | Google Generative AI, Custom Search |

---

## Recommendation Models

### Content-Based Filtering

* Algorithm: TF-IDF Vectorization + Cosine Similarity
* File: `content_recommendation.py`
* Function: `recommend_similar(dest_id)`
* Description: Recommends destinations with similar features such as name and weather type.

### Collaborative Filtering

* Algorithm: SVD (Singular Value Decomposition)
* File: `collab_filtering.py`
* Function: `recommend_for_user(user_id)`
* Description: Suggests destinations based on the behavior of similar users.

### Popularity-Based Filtering

* Algorithm: Ranking by destination click count
* File: `popularity_recommendation.py`
* Function: `get_popularity_recommendations()`
* Description: Lists trending destinations based on user interactions.

---

## Project Structure

```bash
.
├── app.py                       # Main Flask backend
├── collab_filtering.py          # Collaborative Filtering logic
├── content_recommendation.py    # Content-Based recommendation logic
├── popularity_recommendation.py # Popularity-Based logic
├── google-custome-search.py     # Gemini & Google Image APIs
├── go-tour.sql                  # MySQL database schema
├── req.txt                      # Python dependencies
├── templates/                   # HTML templates (Jinja2)
└── static/                      # Static files (images, CSS, JS)
```

---

## How to Run the Project

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/ai-tourist-advisor.git
cd ai-tourist-advisor
```

### 2. Set Up the MySQL Database

* Create a database named `go-tour`
* Import the provided schema:

```bash
mysql -u root -p go-tour < go-tour.sql
```

### 3. Install Required Python Libraries

```bash
pip install -r req.txt
```

### 4. Configure API Keys

In `app.py` and/or `google-custome-search.py`, set your keys:

```python
# Google Gemini API
genai.configure(api_key="YOUR_GEMINI_API_KEY")

# Google Custom Search
GOOGLE_SEARCH_API_KEY = "YOUR_GOOGLE_SEARCH_API_KEY"
GOOGLE_SEARCH_CX = "YOUR_CUSTOM_SEARCH_ENGINE_ID"
```

### 5. Run the Flask App

```bash
python app.py
```

Visit `http://localhost:5000` in your browser.

---

## Core Flask Routes Explained

| Route                  | Description                                                                 |
| ---------------------- | --------------------------------------------------------------------------- |
| `/`                    | Homepage with popularity and personalized suggestions                       |
| `/destination`         | Filter destinations by weather, budget, location                            |
| `/get_destination`     | Returns AI-generated details and images via API                             |
| `/destination-details` | Shows destination overview, nearby places, accommodations, transport routes |
| `/save_click`          | Saves user interaction (click)                                              |
| `/get_clicks`          | Shows recent destination clicks                                             |
| `/about`, `/contact`   | Static pages                                                                |

---

## How to Test the Models

### Popularity-Based:

* Visit `/popularity` or homepage
* Click destinations multiple times
* Frequently clicked destinations will move to the top

### Collaborative Filtering:

* Log in as different users
* Click on varied destinations
* Recommendations adjust based on user similarity

### Content-Based:

* Visit `/destination-details?dest_id=X`
* See similar destinations listed, computed via content similarity

---



## Future Improvements

* Integrate hotel and flight booking APIs
* Add user-generated reviews and ratings
* Deploy to platforms like Render, Heroku, or AWS
* Provide recommendations based on real-time geolocation and traffic data

---

## License

This project is licensed under the MIT License.

---

## Acknowledgements

* Google Generative AI (Gemini)
* Google Custom Search API
* Surprise Recommender Library
* scikit-learn
