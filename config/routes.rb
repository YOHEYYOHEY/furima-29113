Rails.application.routes.draw do
  
  devise_for :users

  root to: 'items#index'
  
  resources :users do
  
  end

  resources :items do
  
  end

end
