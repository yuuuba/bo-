Rails.application.routes.draw do
  root 'tops#index'
  devise_for :users
  resources :ondemands
  resources :ondemand_tags do
    get 'ondemands', to: 'ondemands#search'
  end
end
