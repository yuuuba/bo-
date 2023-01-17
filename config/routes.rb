Rails.application.routes.draw do
  root 'tops#index'
  devise_for :users
  resources :users, only:[:show, :edit, :update, :destroy]
  resources :ondemands
end
