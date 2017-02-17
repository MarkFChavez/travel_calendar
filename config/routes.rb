Rails.application.routes.draw do

  devise_for :users
  root "home#index"

  resources :events do
    resources :notes, only: [:new, :create, :edit, :update, :destroy]
  end

  namespace :users do
    resources :notes, only: [:index, :new, :create, :edit, :update, :destroy]
  end

end
