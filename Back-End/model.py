import mysql.connector
import pandas as pd
import time
from sklearn.linear_model import LinearRegression
import time
import mysql.connector

def connect_to_rojak():
    while True:
        try:
            connection = mysql.connector.connect(
                host="mysql_db",
                port=3306,
                user="root",
                password="root_password",
                database="sg_attractions"
            )
            return connection
        except mysql.connector.Error as err:
            print(f"Error connecting to MySQL: {err}")
            print("Retrying in 5 seconds...")
            time.sleep(5)

def get_prices():
    # Connect to MySQL
    connection = connect_to_rojak()

    # Create a cursor
    cursor = connection.cursor()

    batches = []
    batch_size = 100
    query = 'SELECT * FROM prices'
    
    cursor.execute(query)
    records = cursor.fetchmany(batch_size)
    
    while records:
        # Convert the fetched records into a DataFrame
        df = pd.DataFrame(records, columns=cursor.column_names)
        batches.append(df)
        
        # Fetch the next batch
        records = cursor.fetchmany(batch_size)

    # Close the cursor and connection
    cursor.close()
    connection.close()

    # Concatenate all batches into a single DataFrame
    out = pd.concat(batches, ignore_index=True)
    return out

# Fit, Predict, Insert
def fit_predict_insert(df):
    # One hot encoding
    df['attraction_id'] = df['attraction_id'].astype('category')
    df['price'] = df['price'].astype('float')
    encoded_df = pd.get_dummies(df, drop_first=True)
    X = encoded_df.drop(columns=['price'])
    y = encoded_df['price']

    # Fit LM
    model = LinearRegression()
    model.fit(X, y)

    # Predict next year's price
    next_year = df.groupby(['attraction_id', 'isAdult']).agg({'year': 'max'}).reset_index()
    next_year['year'] += 1
    next_year_encoded = pd.get_dummies(next_year, drop_first=True)
    next_year_encoded = next_year_encoded[['year', 'isAdult', 'attraction_id_2', 'attraction_id_3', 'attraction_id_4']]

    next_year['prediction'] = model.predict(next_year_encoded).round(2)

    # Insert to predictions table
    connection = connect_to_rojak()

    # Create a cursor
    cursor = connection.cursor()

    # Insert each row as a record into prediction table
    for index, row in next_year.iterrows():
        query = "INSERT INTO predictions (attraction_id, year, isAdult, price) VALUES (%s, %s, %s, %s)"
        values = (row['attraction_id'], row['year'], row['isAdult'], row['prediction'])
        cursor.execute(query, values)

    # Commit changes and close cursor and connection
    connection.commit()
    cursor.close()
    connection.close()
    return next_year

if __name__ == "__main__":
    data = get_prices()
    fit_predict_insert(data)