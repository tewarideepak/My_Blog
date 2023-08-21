Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations/registrations' }
  resources :users do
    resources :articles do
      post 'like', to: 'articles#like'
      post 'dislike', to: 'articles#dislike'
      resources :comments
    end
  end
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'articles_with_comments', to: 'articles#articles_with_comments'
end
