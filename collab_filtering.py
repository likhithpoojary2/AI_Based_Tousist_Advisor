from surprise import Dataset, Reader, SVD
from surprise.model_selection import train_test_split
from surprise import accuracy
import pandas as pd
import mysql.connector

class RecommendationSystem:
    def __init__(self):
        self.db_config = {
            "host": "localhost",
            "user": "root",
            "password": "",
            "database": "go-tour"
        }
        self.model = SVD()
        self.df = None
        self._load_data()

    def _load_data(self):
        """Load user click data from the database."""
        db = mysql.connector.connect(**self.db_config)
        query = """
        SELECT uc.user_id, uc.destination_id, COUNT(*) as click_count,
            d.name, d.weatherType, d.imageUrl, d.price, d.nights
        FROM user_clicks uc
        JOIN destinations d ON uc.destination_id = d.id
        GROUP BY uc.user_id, uc.destination_id;
        """
        self.df = pd.read_sql(query, db)
        db.close()

        # Prepare data for the recommendation model
        reader = Reader(rating_scale=(1, 5))
        data = Dataset.load_from_df(self.df[['user_id', 'destination_id', 'click_count']], reader)
        self.df['click_count'] = self.df['click_count'].clip(upper=5)



        # Train the model
        trainset, testset = train_test_split(data, test_size=0.2)
        self.model.fit(trainset)

        # Evaluate model
        predictions = self.model.test(testset)
        print("RMSE:", accuracy.rmse(predictions))

    def recommend_for_user(self, user_id, n=4):
        """Generate top `n` recommendations for a given user."""
        all_destinations = self.df['destination_id'].unique()
        already_clicked = self.df[self.df['user_id'] == user_id]['destination_id'].tolist()
        not_clicked = [d for d in all_destinations if d not in already_clicked]

        predictions = [(d, self.model.predict(user_id, d).est) for d in not_clicked]
        predictions.sort(key=lambda x: x[1], reverse=True)

        top_destinations = [d[0] for d in predictions[:n]]

        # Fetch destination details for recommended destinations
        recommended_destinations = self.df[self.df['destination_id'].isin(top_destinations)][
            ['destination_id', 'name', 'weatherType', 'imageUrl', 'price', 'nights']
        ].drop_duplicates()

        return recommended_destinations.to_dict(orient="records")
