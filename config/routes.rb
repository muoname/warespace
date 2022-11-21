Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users
      resources :sessions
      resources :spaces
      resources :spacecategories
      resources :rents
    end
  end
  
  root 'pages#home'
  match "*path", to: "pages#home", format: false, via: :get
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
