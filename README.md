# Open Data API
The Hack n Akron open data initiative is an API created by Akron area developers in order to provide standardized, easily accessible civic data. With the API we read in CSV files containing city data into a PostgreSQL database that is then scrubbed and standardized and placed into readily accessible tables that can be accessed via Rails to output the data as raw JSON data. The intent of the project is to provide a base API that can be used by application developers to provide users with city data.

## Technical Details
[![Build Status](https://travis-ci.org/hacknakron/open-data-api.svg?branch=master)](https://travis-ci.org/hacknakron/open-data-api)

*Ruby Version*: 2.3.1

*Rails Version*: 5.0.0.1

*Database Type*: PostgresSQL

### Setting up your environment
To get your environment setup, follow this guide: http://guides.rubyonrails.org/getting_started.html
Another great rails resource: https://www.railstutorial.org/

### Setting Environment Variables
The project uses the [dotenv](https://github.com/bkeepers/dotenv) gem to manage environment variables. This is how sensative information is stored (and not committed to source control). To get the application to run, you'll need a file called `.env` in the root of your project. It should have the following items in it:
- FTP_HOST
- FTP_PORT
- FTP_USERNAME
- FTP_PASSWORD

### Running the API Server
1. After downloading the project locally, run `bundle install` in the project root directory.
2. Run `rails db:create db:migrate` to create and setup the database.
3. Run `rake data:import:seed_files` to seed the latest data
4. Run `bundle exec rails s` to start the rails API server.

### Running the File Importer
From the root of the project, run `rake data:import`
NOTE: You must have correctly set the ENV attributes for the import to pull correct data from the FTP server.

### Contributing to the Project
We encourage everyone to submit pull requests to this project when they see something that could be improved. When contributing, we ask that you submit detailed pull request explaining at minimum:

#### What Got Done
- Describe what was done in the pull request.
- Try to keep the pull requests small and focused on smaller issues.

#### How to Test
- Tell us how to test your changes from both a technical aspect and a user aspect.


### /find_where

Finds where a column meets a set parameter.

Valid operators 
```
less_than
les_than_or_equal_to
greater_than
greater_than_or_equal_to
 ```
 
### Parameters:

 column 
 ```
 in: view_akron_ward 
 
 description: Name of column
 
 required: true
 
 type: string
 ```


 operator
 ```
 in: view_akron_ward
 
 description: Comparison operation
 
 required: true
 
 type: string
 ```
 
 
 value
 ```
 in: view_akron_ward
 
 description: Value compared to
 
 required: true
 
 type: string
```
