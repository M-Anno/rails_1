Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users
  resources :profiles, only: [:show, :new, :edit, :create, :update]
  resources :reservations, only: [:index]
  resources :rooms do
    collection do
      get "search"
    end
  end
  resources :rooms do
    resources :reservations, except: :index
  end
  # get "room/search"
  root 'top#index'
end