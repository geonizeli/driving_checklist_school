Rails.application.routes.draw do
  resources :lessons
  resources :lesson_categories

  root "lesson_categories#index"
end
