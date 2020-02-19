Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'

  resources :search, only: [:index]
  resources :questions do
    resources :answers, only: :create do
      resources :answer_comments, only: :create
      end
    end
  end
  resources :articles do
    resources :article_comments, only: :create 
  end
  resources :tags
 end
