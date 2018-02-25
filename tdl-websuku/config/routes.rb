Rails.application.routes.draw do

  resources :orders
  resources :items
  resources :carts, only: [:show] do 
    resources :cart_items, only: [:update, :destroy]
  end
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
  delete '/delete_item' => 'carts#delete_item'
end