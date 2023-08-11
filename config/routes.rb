Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations/registrations' }
  resources :users do
    resources :articles do
      member do
        post 'like'
        post 'dislike'
        delete 'remove_like'
        delete 'remove_dislike'
      end
      resources :comments
    end
  end
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'articles_with_comments', to: 'articles#articles_with_comments'
end
