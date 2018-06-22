Rails.application.routes.draw do
  resources :pins 

  devise_for :users
  root 'pins#index'
  get 'homes/about'
  
  #get 'homes/index'
 

  #get 'pins/index'
  #get 'pins/show'
  #get 'pins/new'
  #get 'pins/create'
  #get 'pins/edit'
  #get 'pins/update'
  #get 'pins/destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
