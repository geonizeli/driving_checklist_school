Rails.application.routes.draw do
  resources :subscriptions
  resources :achievements
  devise_for :users
  resources :lessons
  resources :lesson_categories

  root "lessons#index"
end
