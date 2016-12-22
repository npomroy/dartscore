Rails.application.routes.draw do
  
  root to: 'pages#home'
  devise_for :users
  resources :users do
    resource :profile
  end
  resources :games do
    resources :teams do
      resources :players
    end
    get "/gamesetup", to: 'games#gamesetup'
    get "/editplayers", to: 'games#editplayers'
  end
  get 'about', to: 'pages#about'
end
