Rails.application.routes.draw do

  resources :view_akron_ward, only: [:index]

  get "/view_akron_ward/find_by", to: "view_akron_ward#find_by"

  root 'home#home'
end
