Rails.application.routes.draw do
  root 'articles#index'
  resources :questions do
    collection do
      post "search"
    end
  end
  resources :articles
end
