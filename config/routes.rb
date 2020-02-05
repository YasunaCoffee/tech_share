Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :questions do
    resources :answers, only: :create
    collection do
      get "search"
    end
  end
  resources :articles do
    resources :article_comments, only: :create 
    collection do
      get "search"
    end
  end
  resources :tags
 end
