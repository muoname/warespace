Rails.application.routes.draw do
<<<<<<< HEAD
  get 'page_test/home'
=======
  resources :spaces
  resources :spacecategories
>>>>>>> master
  root 'pages#home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
