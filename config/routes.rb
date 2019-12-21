Rails.application.routes.draw do
  root 'questions#index'
  resources :questions do
    collection do
      get "search"
    end
  end
  resources :articles
end
