Rails.application.routes.draw do
  
  root to: 'pages#home'
  devise_for :users
  resources :users do
    resource :profile
  end
  resources :games do
    resources :players
    #check associations
    resources :teams
    get "/editplayers", to: 'games#editplayers'
  end
  get 'about', to: 'pages#about'
end
