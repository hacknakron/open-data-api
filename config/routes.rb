Rails.application.routes.draw do

  resources :refresh, only: [:index]
  resources :refresh_result, only: [:index]
  resources :view_akron_ward, only: [:index]
  resources :view_akron_ward_error, only: [:index]

  get "/view_akron_ward/find_by", to: "view_akron_ward#find_by"

  root 'home#home'
end
