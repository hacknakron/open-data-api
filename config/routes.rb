Rails.application.routes.draw do
  namespace 'api' do
    root 'root#index'
    resources :parcels, only: [:index, :show]
  end

  root 'home#home'
end
