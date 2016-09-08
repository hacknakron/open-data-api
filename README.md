# Open Data API

## Technical Details
[![Build Status](https://travis-ci.org/hacknakron/open-data-api.svg?branch=master)](https://travis-ci.org/hacknakron/open-data-api)

*Ruby Version*: 2.3.1

*Rails Version*: 5.0.0.1

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
2. Run `rails db:migrate` to setup the database.
3. Run `bundle exec rails s` to start the rails API server.

### Running the File Importer
From the root of the project, run `rake import_ward_data`

### Contributing to the Project
We encourage everyone to submit pull requests to this project when they see something that could be improved. When contributing, we ask that you submit detailed pull request explaining at minimum:

#### What Got Done
- Describe what was done in the pull request.
- Try to keep the pull requests small and focused on smaller issues.

#### How to Test
- Tell us how to test your changes from both a technical aspect and a user aspect.

