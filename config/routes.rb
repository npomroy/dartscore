Rails.application.routes.draw do
  
  root to: 'pages#home'
  devise_for :users
  resources :users do
    resource :profile
  end
  resources :games
  get 'about', to: 'pages#about'
end
