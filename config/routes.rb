Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get 'auth/reddit', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :tournaments
  resources :fighters

  root to: 'static#home'
end
