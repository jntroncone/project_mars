Rails.application.routes.draw do
  get 'carts/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'
<<<<<<< Updated upstream

  get 'products', to: 'products#index', as: 'products'
  get 'products/:id/edit', to: 'products#edit', as: 'edit_product'
  post 'products', to: 'products#create'
  get 'products/new', to: 'products#new', as: 'new_product'
  get 'products/:id', to: 'products#show', as: 'product'
  patch 'products/:id', to: 'products#update'
  delete 'products/:id', to: 'products#destroy'

  get 'carts/:id', to: "carts#show", as: "cart"
  delete 'carts/:id', to: "carts#destroy"
=======
  resources :line_items
  resources :carts
  resources :products
  
>>>>>>> Stashed changes

  post 'line_items/:id/add', to: "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce', to: "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items', to: "line_items#create"
  get 'line_items/:id', to: "line_items#show", as: "line_item"
  delete 'line_items/:id', to: "line_items#destroy"
  
  devise_for :admins
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  get 'users', to: 'users#index', as: 'users' # --------- make only visible to admin
  get 'users/:id', to: 'users#show', as: 'user'
  

  #namespace :admin do
  #  root to: 'products#index'
  #  resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
  #  resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
  #end
end
