Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  root 'pages#home'
  get 'about', to: 'pages#about'
end
