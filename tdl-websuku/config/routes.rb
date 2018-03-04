Rails.application.routes.draw do

  resources :order_items
  resources :orders
  resources :items
  resources :carts, only: [:show] 
  resources :cart_items, only: [:update, :destroy]
  devise_for :admins
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'users/index'
  get 'users/:id' => 'users#show', as: 'user' #マイページ
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'
  post '/confirm_order' => 'order_items#confirm_order'
end
