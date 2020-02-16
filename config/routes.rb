Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => "welcome#home"

  resources :players, only: [:new, :create]
  resources :players, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'register', to: 'players#new'
  get 'login', to: 'sessions#new'
  get '/auth/:provider/callback' => 'sessions#omniouth'
  
  delete '/logout', to: 'sessions#destroy'
end