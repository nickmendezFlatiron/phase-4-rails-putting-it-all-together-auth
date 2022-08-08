Rails.application.routes.draw do
  resources :recipes , only: [:index , :create]
  # resources :users
  
  #Users Controller
  post "/signup" , to: "users#create"
  get "/me" , to: "users#show"

  #Sessions Controller
  post "/login", to: "sessions#create"
  delete "/logout" ,to: "sessions#destroy"

  #Recipes Controller
end
