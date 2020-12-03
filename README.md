# PRCD_341
Database and web interface for CWRU's Physical Resource Center. Project for EECS 341.

## Dependencies
1. MySQL
2. JavaScript: ReactJS and `npm`
3. Python 3: Flask, `flask_mysqldb`, `flask_cors`, and `pytz`

## Setup
This project is locally hosted and hence involves some setup:
1. Install the required dependencies
2. Open MySQL on your local machine and create a new user with username `admin` and password `prcd`
3. Login to MySQL with this user and create a database named PRCD
4. Use the schema specifications in `tables.sql` to create tables in the PRCD database. You may want to use the CSV files to insert dummy values into the system.

## Running the Project
1. Open a new Terminal window and `cd` into the project directory. Make sure your local MySQL server is running.
2. Run the following command: `export FLASK_APP=backend.py`
3. Run the command `flask run`. The backend should now be up and running.
4. `cd`into prcd_341 subdirectory.
5. Run `npm install`
6. Run `npm start`. You will now be redirected to a browser window running the frontend.
7. All set! Enjoy the project!
