Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :directories do
    resources :posts
  end

  resources :access_requests, only: [:new, :create]

  namespace :admin do
    resources :access_requests, only: [:index, :update, :destroy] do
      member do
        patch :approve
        patch :deny
      end
    end
  end
end
