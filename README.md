# Open Data API

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

### API

The API endpoints only return json data and are found under the `api/` url
namespace. All successful responses will have the data payload under a `data`
property at the top-level of the response. For responses that contain multiple
objects, they will contain a `meta` object with `count` and `pages` which refer
to the total number of records in the database and the total number of pages
which can be requested.

#### Pagination

For API calls that return multiple results, you can pass a `page` and `per_page`
query parameter to the API request to return a certain page of results (default
of first page) and a set number of results per page (default of 50). We do
not let you request more than 100 per page.

Example API calls:

```
/api/parcels # use defaults
/api/parcels?page=10 # return page 10 of the results using 50 per page
/api/parcels?per_page=10&page=24 # override both the page and per_page params
```

#### Filtering

Filtering is setup at the controller level and each accepted propery has to
explicitly be whitelisted to be used in the `where` clause of the request. By
default, there are no filters placed on the data.

Each filter is in a specific format so that multiple values can be can be
OR'd together to form the final query.

For example:

##### Filter Single Property

`/api/parcels?filters[tax_year][]=2017`

This will return the first page of parcels for tax year 2017.

##### Filter Single Property with Multiple Values

`/api/parcels?filters[tax_year][]=2017&filters[use_class][]=A`

This will return the first page of parcels for tax year 2017 with land use class
of "A".

### API Endpoints

##### GET /api(.json)

This API endpoint returns some generic information about the API. It's static
data and does not change (as of now).

##### GET /api/land_use_codes(.json)

This returns land use code information where each object contains:

- id
- object_id
- value
- label
- created_at
- updated_at
- use_class

##### GET /api/land_use_codes/:id(.json)

This returns a specific land use code object which contains:

- id
- object_id
- value
- label
- created_at
- updated_at
- use_class

##### GET /api/land_use_codes/classes(.json)

This returns an array of objects that contain land use class letter identifiers
and a human readable name for each similar to the following:

```
[
    { "use_class": "A", "name": "Agriculture" },
    { "use_class": "M", "name": "Mineral Rights" },
    { "use_class": "I", "name": "Industrial" },
    { "use_class": "O", "name": "Oil and Gas" },
    { "use_class": "C", "name": "Commercial" },
    { "use_class": "R", "name": "Residential" },
    { "use_class": "E", "name": "Exempt" },
    { "use_class": "P", "name": "Public Utilities" },
    { "use_class": "G", "name": "Oil and Gas interests" },
    { "use_class": "U", "name": "Railroad" }
]
```

##### GET /api/parcels(.json)

This returns parcel information where each parcel contains:

- id
- object_id
- parcel_id
- tax_year
- alternate_id
- address_number
- address_direction
- address_street
- address_suffix
- address_suffix_2
- address
- zip_code
- acres
- current_resident_1
- current_resident_2
- owner_1
- owner_2
- owner_address_1
- owner_address_2
- owner_address_3
- owner_zip_code
- owner_zip_code_2
- owner_city
- owner_state
- description
- land_use_code_id
- created_at
- updated_at
- city_owned
- use_code
- use_class

##### GET /api/parcels/:id(.json)

This returns parcel information for a specific partial. It contains the fields
mentioned in the above request.

##### GET /api/parcels/:id/sales(.json)

This returns parcel sale information for a specific partial. Each sale has the
following fields:

- id
- object_id
- parcel_id
- sales_date
- price
- transaction_date
- previous_owner
- new_owner
- approximate_total
- created_at
- updated_at
- parid

##### GET /api/sales(.json)

This returns parcel sale information. Each sale has the following fields:

- id
- object_id
- parcel_id
- sales_date
- price
- transaction_date
- previous_owner
- new_owner
- approximate_total
- created_at
- updated_at
- parid

##### GET /api/sales/:id(.json)

This returns specific parcel sale information that includes the fields in the
above API call.
