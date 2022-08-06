Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'home#top'
  resources :rooms
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
