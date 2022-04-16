Rails.application.routes.draw do
  
  resources :users
  resources :projects
  resources :galleries
  resources :images

  get 'gallery/show_galleries'


  post '/auth/login', to: 'authentication#login'
end
