Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, controllers: { 
    registrations: 'registrations',
    omniauth_callbacks: 'omniauth_callbacks'
  }
  
  resource :user, only: [:edit, :update]

  resource :user_recent_transaction, only: [:new, :create]
  resources :user_next_transfers, only: [:new, :show, :create]

  resources :service_providers, only: [:show], path: 'providers'

  resources :feedbacks, only: [:create]
  resources :referrals, only: [:create]

  resources :pages, only: [:show]

  root to: 'user_next_transfers#new'

  get 'how-to', to: 'pages#show', defaults: {id: 'how_to'}

  get 'welcome' => 'welcome#index'
  get '*path' => 'welcome#index'
end
