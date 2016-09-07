# Open Data API

## Technical Details
### Setting Environment Variables
The project uses the [dotenv](https://github.com/bkeepers/dotenv) gem to manage environment variables. This is how sensative information is stored (and not committed to source control). To get the application to run, you'll need a file called `.env` in the root of your project. It should have the following items in it:
- FTP_HOST
- FTP_PORT
- FTP_USERNAME
- FTP_PASSWORD

### Running the API Server
1. After downloading the project locally, run `bundle install` in the project root directory.
2. Run `rails db:migrate` to setup the database.

### Running the File Importer
From the root of the project, run `rake import_ward_data`

