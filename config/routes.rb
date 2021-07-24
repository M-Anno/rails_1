Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users
  resources :profiles, only: [:show, :new, :edit, :create, :update]
  resources :reservations, only: [:index]
  resources :rooms
  resources :rooms do
    resources :reservations, except: :index
  end
  root 'top#index'
end