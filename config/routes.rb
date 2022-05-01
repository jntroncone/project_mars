Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'


  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"
  resources :carts
  resources :products
  resources :orders
  
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
