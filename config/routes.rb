Rails.application.routes.draw do
  get 'pages/home/:id', to: 'pages#home', as: 'pages_home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
