Rails.application.routes.draw do

  devise_for :users
  root "home#index"

  resources :events do
    resources :notes, only: [:new, :create]
  end

end
