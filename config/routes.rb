Rails.application.routes.draw do
  
  
  devise_for :users
  resources :friends
  root 'home#index'
  get 'home/about'
  post 'friends/new'
  get '/contact', to: 'contact#new'
  post '/contact', to: 'contact#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
