Rails.application.routes.draw do
  devise_for :users
  resources :lessons
  resources :lesson_categories

  root "lessons#index"
end
