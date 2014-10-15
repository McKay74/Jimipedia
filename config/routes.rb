Rails.application.routes.draw do
  get 'collaborators/new'

  get 'collaborators/show'

  get 'users/wikis'

  resources :wikis

  devise_for :users

  root to: 'home#index'

  resources :charges, only: [:new, :create]

end

