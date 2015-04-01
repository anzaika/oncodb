Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "admin/dashboard#index"

  # root to: 'searches#new'
  # resources :searches
  #
  # resources :drugs, only: [:show] do
  #   resources :diseases
  #   resources :genes
  # end
  # resources :diseases, only: [:show] do
  #   resources :genes
  #   resources :drugs
  # end
  # resources :genes, only: [:show] do
  #   resources :diseases
  #   resources :drugs
  # end
end
