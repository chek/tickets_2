Rails.application.routes.draw do
  get 'home/index'
  resources :tickets
  resources :users
  post 'users/sign_in_ajax', to: 'users#sign_in_ajax'
  post 'users/sign_out_ajax', to: 'users#sign_out_ajax'
  post 'users/sign_up_ajax', to: 'users#sign_up_ajax'
  devise_for :users
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
