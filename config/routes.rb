Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :directories do
    get 'access_denied', on: :member
    resources :posts
  end

  resources :access_requests, only: [:create]

  namespace :admin do
    get 'access_requests/index'
    get 'access_requests/update'
    get 'access_requests/destroy'
    resources :access_requests, only: [:index, :update, :destroy]
  end
end
