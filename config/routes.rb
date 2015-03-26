Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
 
  devise_for :users, skip: [:sessions, :registrations], controllers: { 
    registrations: 'registrations',
    confirmations: 'confirmations',
    omniauth_callbacks: 'omniauth_callbacks'
  }

  as :user do
    patch '/user/confirmation' => 'confirmations#update', via: :patch, as: :update_user_confirmation
    get 'signin' => 'devise/sessions#new', as: :new_user_session
    post 'signin' => 'devise/sessions#create', as: :user_session
    get 'signup' => 'registrations#new', as: :new_user_registration
    post 'signup' => 'registrations#create', as: :user_registration
    delete 'signout' => 'devise/sessions#destroy', as: :destroy_user_session
  end
  
  resource :user, only: [:edit, :update] do
    resource :avatar, only: [:destroy]
  end

  resource 'user-recent-transaction', 
    only: [:new, :create], 
    controller: :user_recent_transactions, 
    as: :user_recent_transaction
  resource 'user-next-transfers', 
    only: [:new, :show, :create],
    controller: :user_next_transfers,
    as: :user_next_transfers
  
  resources :service_providers, only: [:show], path: 'providers'

  resources :feedbacks, only: [:create]
  resources :referrals, only: [:create]

  resources :pages, only: [:show]

  root to: 'user_next_transfers#new'

  get 'how-to', to: 'pages#show', defaults: {id: 'how_to'}
  get 'privacy', to: 'pages#show', defaults: {id: 'privacy'}
  get 'terms', to: 'pages#show', defaults: {id: 'terms'}
  get '/blog' => redirect('http://www.saveonsend.com/blog/')
  
  get 'welcome' => 'welcome#index'
  get '*path' => 'welcome#index'
end
