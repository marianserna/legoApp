Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#show'
  resources :users, only: [:show, :index] do
    resources :challenges, only: [:new, :create]
  end

  resources :challenges, only: [:show] do
    member do
      put 'complete'
      put 'decline'
    end
  end
  resources :likes, only: [:create]
end
