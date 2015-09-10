Rails.application.routes.draw do

  devise_for :users
  root 'home#index'
  resources :home, only: :index do
  end

  resources :events, only: [:show] do
    member do
      get :add_event_subscriber
    end
  end

  namespace :admin do
    root 'events#index'
    resources :categories, except: [:show]
    resources :events, except: [:show]
  end
end
