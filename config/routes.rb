Rails.application.routes.draw do
  root to: 'searches#new'

  resources :searches

  resources :drugs, only: [:show]
  resources :diseases, only: [:show]
  resources :genes, only: [:show]
end
