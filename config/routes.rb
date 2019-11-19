Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
  resources :users, only: [:show, :edit, :update]
  resources :quotes, only: [:index, :show, :new, :create, :edit]
  resources :clients, only: [:index, :show, :new, :create, :edit]

end
