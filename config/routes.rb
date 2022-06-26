Rails.application.routes.draw do
  devise_for :users

  resources :lesson_categories
  resources :lessons
  resources :subscriptions
  resources :achievements

  root "achievements#index"
end
