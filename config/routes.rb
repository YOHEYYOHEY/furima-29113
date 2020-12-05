Rails.application.routes.draw do

  get 'articles/index'
  get 'articles/new'
  get 'articles/show'
  post 'items/new'
  
  devise_for :users

  root to: 'items#index'
  
  resources :users do
  
  end

  resources :items do
  
  end

end
