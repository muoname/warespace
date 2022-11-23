Rails.application.routes.draw do
  
  # scope :api, defaults: { format: :json } do
  #   devise_for :users, controllers: { sessions: :sessions },
  #                      path_names: { sign_in: :login }
  #   resource :user, only: [:show, :update]
  # end

  namespace :api do
    namespace :v1 do
      resources :sessions
      resources :spaces
      resources :spacecategories
      resources :rents
    end
  end

  root 'application#index'
  match "*path", to: "application#index", format: false, via: :get
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
