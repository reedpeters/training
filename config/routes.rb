Rails.application.routes.draw do
  resources :carts, only: [:show] do
    collection do
      get 'add_to'
      post 'remove_from'
      post 'remove_multiple_from'
    end
  end
  resources :products

  root to: 'page#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
