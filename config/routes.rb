Rails.application.routes.draw do
  namespace 'api', defaults: { format: 'json' }, only: [:index, :show], shallow: true do
    root 'root#index'
    resources :land_use_codes do
      collection do
        get :classes
      end
    end
    resources :parcels do
      resources :sales
    end
    resources :sales
  end

  get "about", to: "public#about"
  get "get-involved", to: "public#get_involved"
  get "contact", to: "public#contact"
  root 'housing#index'

  resources :housing, only: [:index]
end
