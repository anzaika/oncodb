Rails.application.routes.draw do
  resources :genes

  root to: 'searches#new'
  resources :searches
end
