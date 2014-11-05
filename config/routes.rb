Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, controllers: { registrations: 'registrations' }
  
  devise_scope :user do 
    root to: 'devise/registrations#new'
  end

  get 'welcome' => 'welcome#index'

  resource :user_recent_transaction, only: [:new, :create]
end
