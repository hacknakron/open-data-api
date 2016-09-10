Rails.application.routes.draw do
  resources :community_learning_center, only: [:index]
  resources :view_akron_ward, only: [:index]
  resources :view_test, only: [:index]
  root 'home#home'
end
