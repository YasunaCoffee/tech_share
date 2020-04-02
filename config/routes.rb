Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root 'articles#index'

  resources :users, only: [:index, :show]

  namespace :search, defaults: { format: 'json' } do
    get 'index'
    get 'users_index'
  end

  resources :questions do
    resources :answers, only: [:create, :destroy] do
      resources :answer_comments, only: [:create, :destroy]
      end
    end

  resources :articles do
    resources :favorites, only: [:create, :index, :destroy]
    resources :article_comments, only: [:create, :destroy]
  end

  get 'information', to: 'articles#information'

  resources :tags

 end
