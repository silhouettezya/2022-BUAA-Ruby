Rails.application.routes.draw do
  resources :users do
    collection do
      get 'login'
      post 'do_login'
      get 'logout'
    end
  end
  #resources :comments
  resources :blogs do
    resources :comments
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
