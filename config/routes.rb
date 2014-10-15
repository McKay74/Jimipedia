Rails.application.routes.draw do
  get 'users/wikis'

  resources :wikis

  devise_for :users

  root to: 'home#index'

  resources :charges, only: [:new, :create]

end

