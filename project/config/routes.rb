Rails.application.routes.draw do
  root 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :sessions
  delete '/logout' => 'sessions#destroy', as: :logout

  namespace :admin do
    get 'sessions/new'
    root 'sessions#new'
    resources :sessions
    resources :categories
  end
end
