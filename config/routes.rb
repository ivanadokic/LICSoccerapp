Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/register', to: 'players#new'
  post '/players' , to: 'players#create'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  root 'application#home'
end
