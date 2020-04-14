Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events do
    resources :schedules, only: [:index, :new, :create] 
 
  end

  resources :players, only: [:new, :create, :show]
  
  #unnested routes
 
  resources :teams, only: [:new, :create] 
  
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'

  get 'register', to: 'players#new'
  
  get '/auth/:provider/callback' => 'sessions#omniauth'
  #expect callback from server 
  
  delete '/logout', to: 'sessions#destroy'

  root to: "pages#home"
end