Rails.application.routes.draw do
  resources :to_do_entries
  get "/home_page", to: "home_page#index"
  root 'home_page#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
