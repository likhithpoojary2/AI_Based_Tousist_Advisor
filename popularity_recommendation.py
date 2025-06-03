import pandas as pd
import mysql.connector

def get_popularity_recommendations():
    # Connect to MySQL
    db = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="go-tour"
    )

    # Fetch user click data along with destination details
    query = """
    SELECT uc.user_id, uc.destination_id, d.name, d.weatherType, d.price, d.imageUrl, d.nights
    FROM user_clicks uc
    JOIN destinations d ON uc.destination_id = d.id;
    """

    df = pd.read_sql(query, db)
    db.close()

    # Get top 10 most popular destinations
    top_destinations = df['destination_id'].value_counts().head(12).reset_index()
    top_destinations.columns = ['destination_id', 'click_count']

    # Merge with destination details
    recommended_destinations = pd.merge(
        top_destinations, 
        df[['destination_id', 'name', 'weatherType', 'price', 'imageUrl', 'nights']].drop_duplicates(), 
        on='destination_id', 
        how='left'
    )

    # Convert to JSON
    return recommended_destinations.to_dict(orient="records")
