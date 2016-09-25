Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#show'
  resources :users, only: [:show, :index] do
    resources :challenges, only: [:new, :create]
  end

  resources :challenges, only: [:index, :show] do
    # new == accept, create == stop
    resources :acceptances, only: [:new, :create]
    resources :declines, only: [:create]
  end
  resources :likes, only: [:create]
end
