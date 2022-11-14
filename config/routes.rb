Rails.application.routes.draw do
  resources :spaces
  resources :spacecategories
  root 'pages#home'
  devise_for :users

  match "*path", to: "pages#home", format: false, via: :get
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
