Rails.application.routes.draw do
  
  resources :users
  resources :projects
  resources :gallery
  resources :images
  post '/auth/login', to: 'authentication#login'
end
