Rails.application.routes.draw do
  root 'articles#index'
  resources :questions do
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
  end  
