Rails.application.routes.draw do

  get 'articles/index'
  get 'articles/new'
  get 'articles/show'
  post 'items/new'

  get  'orders/index'
  post 'orders/create'
  
  devise_for :users

  root to: 'items#index'
  
  resources :users do
  
  end

  resources :items do
    resources :orders
  end

end
