Rails.application.routes.draw do
  root 'static_pages#home'
  get 'contact',   to: 'static_pages#contact', as: 'contact'
  get 'about',     to: 'static_pages#about',   as: 'about'
  get 'signup',    to: 'users#new',            as: 'signup'
  post 'signup',   to: 'users#create'
  get 'login',     to: 'sessions#new'
  post 'login',    to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :posts do
    member do
      get 'preview'
    end
  end
end
