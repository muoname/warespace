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
      resources :pages
      resources :spacecategories
      resources :rents
      # get 'pages/home/:address', to: 'pages#index'
      get '/maps/nearby/:address', to: 'maps#index'

      post '/myspaces', to: 'spaces#myspaces'
      post '/myrents', to: 'spaces#myrents'
      get '/show_rents', to: 'rents#show_rents'
      
      get '/search', to: 'spaces#search'
    end
  end
  patch 'users/switch/:id', to: 'users#switch'
  patch 'users/:id', to: 'users#update'
  get 'users/:id', to: 'users#show'
 
  # root 'application#index'
  # match "*path", to: "application#index", format: false, via: :get
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
