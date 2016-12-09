Rails.application.routes.draw do
  resources :parcel, only: [:index]
  resources :ward, only: [:index]
  root 'home#home'
end
