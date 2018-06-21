Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  
  get 'homes/index'
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
