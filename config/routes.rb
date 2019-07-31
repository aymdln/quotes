Rails.application.routes.draw do
  get 'clients/index'
  get 'clients/show'
  get 'quotes/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
  # get "/quotes", to: "quotes#index"

  resources :quotes, only: [:index, :show]

end
