Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  
  get 'homes/index'
  get 'homes/about'

  #get 'pins/index'
  #get 'pins/show'
  #get 'pins/new'
  #get 'pins/create'
  #get 'pins/edit'
  #get 'pins/update'
  #get 'pins/destroy'
  resources :pins 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
