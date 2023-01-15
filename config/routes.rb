Rails.application.routes.draw do
  get 'ondemand_reals/index'
  get 'ondemand_reals/show'
  get 'ondemand_reals/new'
  get 'ondemand_reals/edit'
  get 'ondemand_reals/create'
  get 'ondemand_reals/update'
  get 'ondemand_reals/destroy'
  get 'ondemands/index'
  get 'ondemands/show'
  get 'ondemands/new'
  get 'ondemands/edit'
  get 'ondemands/create'
  get 'ondemands/update'
  get 'ondemands/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
