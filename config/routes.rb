Rails.application.routes.draw do
  resources :users
  resources :post_images
  resources :posts
  
 post '/admin_login', to: "application#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # namespace :api do
  #   namespace :v1 do
  #     resources :users, only: [:index, :create]
  #     post "/login", to: "auth#create"
  #     get "/profile", to: "users#profile"
  #   end
  # end
end
