Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
end
