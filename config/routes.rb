Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  resources :users, only: [:index, :show]
  post 'follow/:following_id', to: 'follows#follow', as: :follow
  delete 'un-follow/:following_id', to: 'follows#un_follow', as: :unfollow
  root 'home#index'
end
