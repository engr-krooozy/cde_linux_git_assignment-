import pandas as pd

def extract_data(source):
    """
    Extracts data from the specified source.
    Replace this with actual data extraction logic.
    Example: Read from a CSV, query a database, fetch from an API.
    """
    print(f"Extracting data from {source}...")
    # Placeholder: Replace with actual extraction logic
    data = pd.DataFrame({
        'col1': [1, 2, 3],
        'col2': ['A', 'B', 'C']
    }) # Example DataFrame
    print("Data extracted successfully.")
    return data

def transform_data(data):
    """
    Transforms the extracted data.
    Replace this with actual data transformation logic.
    Example: Clean data, filter rows, aggregate data, create new features.
    """
    print("Transforming data...")
    # Placeholder: Replace with actual transformation logic
    # Example: Convert 'col1' to string
    if not data.empty:
        data['col1'] = data['col1'].astype(str) 
    print("Data transformed successfully.")
    return data

def load_data(data, destination):
    """
    Loads the transformed data to the specified destination.
    Replace this with actual data loading logic.
    Example: Write to a CSV, load into a database table, send to an API.
    """
    print(f"Loading data to {destination}...")
    # Placeholder: Replace with actual loading logic
    if not data.empty:
        # Example: Print to console or save to a dummy file
        print("Transformed Data:")
        print(data.to_string()) 
    # data.to_csv(destination, index=False) # Example: saving to CSV
    print("Data loaded successfully.")

if __name__ == "__main__":
    # Define source and destination (replace with actual paths/connections)
    data_source = "path/to/source/data.csv" 
    data_destination = "path/to/destination/output.csv" 

    print("Starting ETL pipeline...")
    
    # Step 1: Extract
    extracted_data = extract_data(data_source)
    
    # Step 2: Transform
    transformed_data = transform_data(extracted_data)
    
    # Step 3: Load
    load_data(transformed_data, data_destination)
    
    print("ETL pipeline finished.")
