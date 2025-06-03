import pandas as pd
import mysql.connector
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

def get_data_from_db():
    """Fetches destination and user click data from MySQL database."""
    db = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="go-tour"
    )
    query = """
    SELECT uc.user_id, uc.destination_id, d.name, d.weatherType, d.price, d.imageUrl, d.nights
    FROM user_clicks uc
    JOIN destinations d ON uc.destination_id = d.id;
    """
    
    df = pd.read_sql_query(query, con=db)
    db.close()  # Close the database connection after fetching data

    if df.empty:
        return None
    
    df['destination_id'] = df['destination_id'].astype(int)
    df['combined_features'] = df['name'] + " " + df['weatherType']
    return df

def recommend_similar(dest_id, n=4):
    """Recommends similar destinations based on TF-IDF cosine similarity."""
    df = get_data_from_db()
    
    if df is None or df.empty:
        return {"error": "No data available"}

    if dest_id not in df['destination_id'].values:
        return {"error": "Invalid Destination ID"}
    
    # TF-IDF Vectorization
    vectorizer = TfidfVectorizer()
    feature_matrix = vectorizer.fit_transform(df['combined_features'])
    
    # Cosine Similarity Matrix
    similarity_matrix = cosine_similarity(feature_matrix)
    
    # Get index of the given destination_id
    index = df[df['destination_id'] == dest_id].index[0]
    
    # Get similarity scores & sort by highest similarity
    similar_destinations = sorted(
        list(enumerate(similarity_matrix[index])), 
        key=lambda x: x[1], 
        reverse=True
    )
    
    # Collect recommended destinations (excluding the input destination itself)
    recommended_ids = set()
    recommended_destinations = []

    for i, score in similar_destinations:
        rec_dest_id = df.iloc[i]['destination_id']
        
        if rec_dest_id != dest_id and rec_dest_id not in recommended_ids:
            recommended_ids.add(rec_dest_id)
            recommended_destinations.append(df.iloc[i])
        
        if len(recommended_destinations) == n:
            break
    
    # Convert to JSON-like format, including imageUrl and nights
    return pd.DataFrame(recommended_destinations)[['destination_id', 'name', 'weatherType', 'price', 'imageUrl', 'nights']].to_dict(orient='records')

# Example Usage
# print(recommend_similar(3))  # Replace 3 with a valid destination ID
