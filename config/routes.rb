Rails.application.routes.draw do
  namespace 'api', only: [:index, :show], shallow: true do
    root 'root#index'
    resources :parcels do
    	resources :sales
    end
    resources :sales
  end

  root 'housing#index'

  resources :housing, only: [:index]
end
