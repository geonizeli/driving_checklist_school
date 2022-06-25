Rails.application.routes.draw do
  resources :lesson_categories

  root "lesson_categories#index"
end
