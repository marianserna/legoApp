Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#show'
  resources :users, only: [:show, :index]
  resources :challenges, only: [:new, :create, :show] do
    member do
      put 'complete'
      put 'decline'
    end
  end
  resources :likes, only: [:create]
end
