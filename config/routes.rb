Rails.application.routes.draw do
  resources :tweets
  devise_for :users

  root 'home#index'
end
