Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get '/', to: 'home#top'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
