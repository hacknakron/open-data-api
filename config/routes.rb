Rails.application.routes.draw do

  resources :view_akron_ward, only: [:index]

  get "/view_akron_ward/find_by", to: "view_akron_ward#find_by"
  get "/view_akron_ward/find_where", to: "view_akron_ward#find_where"

  root 'home#home'
end
