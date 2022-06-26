Rails.application.routes.draw do
  devise_for :users

  resources :achievements
  resources :subjects
  resources :subscriptions

  root "achievements#index"
end
