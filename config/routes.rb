Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :articles do
      resources :comments
    end
  end
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'articles_with_comments', to: 'articles#articles_with_comments'
end
