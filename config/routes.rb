Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, controllers: { 
    registrations: 'registrations',
    omniauth_callbacks: 'omniauth_callbacks'
  }
  
  resource :user, only: [:edit, :update]

  resource :user_recent_transaction, only: [:new, :create]
  resource :user_next_transfers, only: [:new, :show, :create]

  resources :service_providers, only: [:show], path: 'providers'

  resources :feedbacks, only: [:create]
  resources :referrals, only: [:create]

  resources :pages, only: [:show]

  root to: 'user_next_transfers#new'

  get 'how-to', to: 'pages#show', defaults: {id: 'how_to'}

  get 'privacy', to: 'pages#show', defaults: {id: 'privacy'}
  get 'terms', to: 'pages#show', defaults: {id: 'terms'}

  get 'welcome' => 'welcome#index'
  get '*path' => 'welcome#index'
end
