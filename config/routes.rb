Rails.application.routes.draw do
  devise_for :users
  root "homepage#index"
  post   '/customer/cart/:id', to: "customer/carts#create"
  
  get 'checkout', to: 'checkouts#show'
  get 'checkout/success', to: 'checkouts#success'
  get 'billing' , to: 'billing#show'

  namespace :admin do
    get '/subcategories/:id', to: "subcategories#new"
    get '/customers', to: 'listing#customer_index'
    get '/suppliers', to: 'listing#supplier_index' 
    get '/products', to: 'listing#products_index' 
    resources :dashboard ,:only => [:index]
    resources :categories
    resources :subcategories
    resources :orders, :only => [:index]
    patch '/orders', to: 'orders#update'
    end
  
  namespace :customer do
    get 'dashboard' , to: 'dashboard#index'
    patch '/cart', to: 'carts#update'
    delete '/carts/:id' , to: 'carts#destroy'
    resources :categories
    resources :products
    resources :carts
    # resources :cart_products
    resources :order
   end
  
  namespace :supplier do
    resources :dashboard 
    get '/product/:id', to: "products#show", as: 'category_product'
    get '/add/:id', to: "products#new"
    resources :categories
    resources :products
  end
end
