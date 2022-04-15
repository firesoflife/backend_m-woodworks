Rails.application.routes.draw do
  
  resources :users
  resources :projects
  resources :galleries
  resources :images
  post '/auth/login', to: 'authentication#login'
end
