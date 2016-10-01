Rails.application.routes.draw do
  resources :tickets
  resources :users
  post 'users/sign_in_ajax', to: 'users#sign_in_ajax'
  post 'users/sign_out_ajax', to: 'users#sign_out_ajax'
  devise_for :users
  root to: "tickets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
