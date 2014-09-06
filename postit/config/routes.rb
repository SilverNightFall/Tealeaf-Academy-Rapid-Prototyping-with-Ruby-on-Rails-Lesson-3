PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  resources :categories
  resources :posts do
    resources :comments, only: [:create]
  end
end
