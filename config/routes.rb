Rails.application.routes.draw do
  get 'cart', to: 'cart#show'

  post 'cart/add'

  post 'cart/:id/add_quantity' => 'cart#add_quantity', as: 'cart_add_quantity'

  post 'cart/:id/reduce_quantity' => 'cart#reduce_quantity', as: 'cart_reduce_quantity'

  post 'cart/remove'

  resources :products

  root 'products#index'
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
