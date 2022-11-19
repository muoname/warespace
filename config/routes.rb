Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :spaces
      resources :spacecategories
      resources :rents
    end
  end

  devise_for :users
  
  root 'application#index'
  match "*path", to: "application#index", format: false, via: :get
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
