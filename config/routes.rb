Rails.application.routes.draw do
  root 'static_pages#home'
  get 'contact', to: 'static_pages#contact', as: 'contact'
  get 'about', to: 'static_pages#about', as: 'about'
  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'
  resources :users
end
