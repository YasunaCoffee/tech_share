Rails.application.routes.draw do
  root 'questions#index'
  resources :questions do
    collection do
      post "search"
    end
  end
end
