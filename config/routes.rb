Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'

  get 'products', to: 'products#index', as: 'products'
  get 'products/:id/edit', to: 'products#edit', as: 'edit_product'
  post 'products', to: 'products#create'
  get 'products/new', to: 'products#new', as: 'new_product'
  get 'products/:id', to: 'products#show', as: 'product'
  patch 'products/:id', to: 'products#update'
  delete 'products/:id', to: 'products#destroy'


  devise_for :admins
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  get 'users', to: 'users#index', as: 'users' # --------- make only visible to admin
  get 'users/:id', to: 'users#show', as: 'user'
  

  namespace :admin do
    root to: 'products#index'
    resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  get 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'find_product_to_add_from_cart'
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  get 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'find_product_to_delete_from_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
end
