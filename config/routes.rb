Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'searches#index'

  resources :searches

  resources :drugs do
    resources :diseases
    resources :genes
  end
  resources :diseases do
    resources :genes
    resources :drugs
  end
  resources :genes do
    resources :diseases
    resources :drugs
  end
end
