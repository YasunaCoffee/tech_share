Rails.application.routes.draw do
  root 'questions#index'
  resources :questions
  resources :articles
end
