Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get 'auth/reddit', as: 'login'
  get 'auth/failure', to: 'sessions#failure'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :tournaments
  resources :fighters
  resources :picks

  root to: 'static#home'
end
