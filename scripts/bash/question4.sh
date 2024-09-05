#!/bin/bash
# using `psql` to connect without a password 

# Create the database
psql -c "CREATE DATABASE posey;"

# Import the CSV file 
psql -d posey -c "COPY orders FROM '/Users/cde_linux_git_assignment-/ParchPosey.csv' DELIMITER ',' CSV HEADER;" 
