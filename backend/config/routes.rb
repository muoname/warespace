Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'

  namespace :api do
    namespace :v1 do
      resources :spaces
      resources :spacecategories
      resources :rents
      
    end
  end
  patch 'users/switch/:id', to: 'users#switch'
  patch 'users/:id', to: 'users#update'
  root 'application#index'
  match "*path", to: "application#index", format: false, via: :get
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
