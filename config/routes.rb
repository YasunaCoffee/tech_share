Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :questions do
    collection do
      get "search"
    end
  end
  resources :articles do
    collection do
      get "search"
    end
  end
  resources :articles
  resources :tags
end
