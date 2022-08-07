Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'home#top'
  resources :rooms
  resources :users, only: [:update]
  get 'users/account', to: 'users#account'
  get 'users/profile', to: 'users#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
