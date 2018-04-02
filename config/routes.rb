Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get 'auth/reddit', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root to: 'static#home'
end
