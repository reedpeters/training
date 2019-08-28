Rails.application.routes.draw do
  devise_for :users

  resources :carts, only: [:show] do
    collection do
      get 'add_to'
      post 'remove_from'
      post 'remove_multiple_from'
    end
  end
  resources :products

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
