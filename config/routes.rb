Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root 'articles#index'

  resources :search, only: [:index]

  resources :questions do
    resources :answers, only: [:create, :destroy] do
      resources :answer_comments, only: [:create, :destroy]
      end
    end

  resources :articles do
    resources :favorites, only: [:create, :index]
    resources :article_comments, only: [:create, :destroy]
  end

  resources :tags
 end
