Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, controllers: { 
    registrations: 'registrations',
    omniauth_callbacks: 'omniauth_callbacks'
  }
  
  devise_scope :user do 
    root to: 'devise/registrations#new'
  end

  resource :user, only: [:edit, :update]

  resource :user_recent_transaction, only: [:new, :create]
  resources :user_next_transfers, only: [:new, :show, :create]

  resources :service_providers, only: [:show], path: 'providers'

  resources :feedbacks, only: [:create]
  resources :referrals, only: [:create]

  resources :pages, only: [:show]

  get 'how-to', to: 'pages#show', defaults: {id: 'how_to'}

  get 'welcome' => 'welcome#index'
  get '*path' => 'welcome#index'
end
