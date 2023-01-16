Rails.application.routes.draw do
  root 'tops#index'
  devise_for :users
  resources :ondemands
end
