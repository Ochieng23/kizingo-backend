Rails.application.routes.draw do
  resources :inventories
  resources :constructionsitesworkers
  resources :agents
  resources :staffs
  resources :progresses
  resources :subactivities
  resources :activities
  resources :phases
  resources :construction_sites
  resources :house_seekers
  resources :admins
  resources :properties
  resources :users
  post '/login', to: 'auth#login'
  post '/register', to: 'user#register'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
