class API::RootController < API::BaseController
  def index
    api_information = {
      data: {
        organization: 'Hack N Akron',
        project: {
          name: 'Open Data API',
          repository: 'https://github.com/hacknakron/open-data-api'
        },
        location: {
          address1: '',
          address2: '',
          city: 'Akron',
          country: 'United States',
          state: 'OH',
          zip_code: '44308'
        }
      },
      errors: {}
    }

    render json: api_information
  end
end
