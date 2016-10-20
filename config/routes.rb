Rails.application.routes.draw do
  resources :ward, only: [:index]
  root 'home#home'
end
