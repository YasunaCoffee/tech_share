Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root 'articles#index'

  resources :users, only: [:index, :show]

  resources :search, only: [:index]
  resources :questions do
    resources :answers, only: :create do
      resources :answer_comments, only: :create
      end
    end

  resources :articles do
    resources :article_comments, only: :create
    resources :favorites, only: [:create, :index]
  end

  resources :tags

 end
