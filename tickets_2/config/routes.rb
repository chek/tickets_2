Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  get 'home/index'
  post 'users/sign_in_ajax', to: 'users#sign_in_ajax'
  post 'users/sign_out_ajax', to: 'users#sign_out_ajax'
  post 'users/sign_up_ajax', to: 'users#sign_up_ajax'
  post 'users/update_role', to: 'users#update_role'
  get 'users/list', to: 'users#index'
  get 'users/get_current_user', to: 'users#get_current_user'
  post 'tickets/create', to: 'tickets#create'
  get 'tickets/list', to: 'tickets#index'
  devise_for :users
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
