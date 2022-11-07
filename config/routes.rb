Rails.application.routes.draw do
  get 'page_test/home'
  get 'page_test/space_recording'
  get 'page_test/account'
  resources :spaces
  resources :spacecategories
  root 'pages#home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
