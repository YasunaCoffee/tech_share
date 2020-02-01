Rails.application.routes.draw do
  root 'articles#index'
  resources :questions do
    resources :answers, only: :create
    collection do
      get "search"
    end
  end
  resources :articles do
    collection do
      get "search"
    end
  end
  resources :tags
end
