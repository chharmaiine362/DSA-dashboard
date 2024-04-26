import mysql.connector
import pandas as pd
import time
import json
from sklearn.linear_model import LinearRegression

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

    # Fetch records in batches
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
    df['category'] = df['category'].astype('category')
    df['price'] = df['price'].astype('float')
    encoded_df = pd.get_dummies(df, drop_first=True)

    X = encoded_df.drop(columns=['price'])
    y = encoded_df['price']

    # Fit LM
    model = LinearRegression()
    model.fit(X, y)

    # Predict next year's price
    next_year = df.groupby(['attraction_id', 'category']).agg({'year': 'max'}).reset_index()
    next_year['year'] += 1
    next_year_encoded = pd.get_dummies(next_year, drop_first=True)
    next_year['price'] = model.predict(next_year_encoded).round(2)

    # Insert to predictions table
    connection = connect_to_rojak()
    cursor = connection.cursor()    

    # Insert each row as a record into prediction table
    for index, row in next_year.iterrows():
        query = "INSERT INTO predictions (attraction_id, year, category, price) VALUES (%s, %s, %s, %s)"
        values = (row['attraction_id'], row['year'], row['category'], row['price'])
        cursor.execute(query, values)

    # Commit changes and close cursor and connection
    connection.commit()
    cursor.close()
    connection.close()

    # Generete data.json
    data = pd.concat([df, next_year])
    data_to_json(data)
    return next_year

def data_to_json(data):
    # Get attractions name and acronym
    connection = connect_to_rojak()
    cursor = connection.cursor()

    query = 'SELECT * FROM attractions'

    cursor.execute(query)
    records = cursor.fetchall()
    attractions = pd.DataFrame(records, columns=cursor.column_names)

    # Close the cursor and connection
    cursor.close()
    connection.close()

    # Inner join on attraction_id
    merged_df = pd.merge(data, attractions, left_on='attraction_id', right_on='id', how='inner')
    merged_df = merged_df[['acronym', 'year', 'category', 'price']].sort_values(['acronym', 'category', 'year'])

    # Create the JSON structure
    json_data = {
        "years": sorted(merged_df['year'].unique().tolist()),
        "data": []
    }

    prev_name = ""
    dic = {'name': "", 'values': []}
    
    for index, row in merged_df.iterrows():
        name = f"{row['acronym']}-{row['category']}"
        if name != prev_name:
            if prev_name:
                json_data['data'].append(dic.copy())
            prev_name = name
            dic['name'] = name
            dic['values'] = []

        dic['values'].append(row['price'])

    # Append the last entry
    json_data['data'].append(dic)

    # Save to data.json
    with open('./data.json', 'w') as outfile:
        json.dump(json_data, outfile)

if __name__ == "__main__":
    data = get_prices()
    fit_predict_insert(data)