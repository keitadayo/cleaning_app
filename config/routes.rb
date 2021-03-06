Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root 'posts#index'  
  resources :users, only: :new
  resources :posts do
    resources :goods, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end
