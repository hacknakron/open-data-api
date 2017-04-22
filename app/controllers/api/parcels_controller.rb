class API::ParcelsController < API::BaseController
  def index
    render json: { hello: 'world' }
  end

  def show
    render json: { hello: 'show' }
  end
end
