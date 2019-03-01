Rails.application.routes.draw do
  root to: 'dashboard#index'

  get 'secret', to: 'dashboard#secret', as: 'secret'

  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'login',  to: 'sessions#new', as: 'login'
  get 'signup', to: 'users#new', as: 'signup'

  resource :users, only: [:new, :create, :destroy]
  resources :sessions, only: [:create, :destroy]
end
