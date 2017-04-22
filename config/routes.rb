Rails.application.routes.draw do
  namespace 'api' do
    root 'root#index'
    resources :parcels, only: [:index, :show]
    resources :sales, only: [:index, :show]
  end

  root 'housing#index'
  
  resources :housing, only: [:index]
end
