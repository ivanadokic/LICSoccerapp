Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => "welcome#home"
  
  resources :events, only: [:index, :edit, :update] do
  resources :schedules, only: [:index, :new, :create] 
 
  end

  resources :players, only: [:new, :create]
  
  #unnested routes
  resources :events, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :teams, only: [:new, :create] 
  
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'

  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'register', to: 'players#new'
 
 
 
  
  
  get '/auth/:provider/callback' => 'sessions#omniauth'
  #expect callback from server 
  
  delete '/logout', to: 'sessions#destroy'
end