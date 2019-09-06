Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :quotes, only: [:index, :show, :new, :create]
  resources :clients, only: [:index, :show, :new, :create]

end
