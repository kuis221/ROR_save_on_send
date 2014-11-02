Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  
  devise_scope :user do 
    root to: 'devise/registrations#new'
  end

  get 'welcome' => 'welcome#index'
end
