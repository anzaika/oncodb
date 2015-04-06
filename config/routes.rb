Rails.application.routes.draw do
  root to: 'searches#new'

  resources :searches

  resources :drugs, only: [:show] do
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
