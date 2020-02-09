Rails.application.routes.draw do
  root 'articles#index'
  resources :search, only: [:index]
  resources :questions
  resources :articles
end
