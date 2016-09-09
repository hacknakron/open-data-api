Rails.application.routes.draw do
  resources :community_learning_center, only: [:index]
  root 'home#home'
end
