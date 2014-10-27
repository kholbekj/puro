Rails.application.routes.draw do
  get 'dashboard/index'

  root 'home#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
