Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :favourites, only: [:index]
  end

  resources :categories do
    resources :facilities, only: [:show]
  end

  resources :facilities do
    resources :reviews, only: %i[new create show]
    collection do
      get :search
    end
  end

  get "/community", to: "channels#community"
end
