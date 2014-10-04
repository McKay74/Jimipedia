Rails.application.routes.draw do
  get 'users/wikis'

  # get 'wikis/index'

  # get 'wikis/show'

  # get 'wikis/new'

  # get 'wikis/edit'

  # get 'wikis/destroy'
  resources :wikis

  devise_for :users

  root to: 'home#index'
end
