Rails.application.routes.draw do


  resources :blogs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'blogs#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
