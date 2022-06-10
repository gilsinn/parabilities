Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :categories
=======
  resources :users do
    resources :favourites, only: [ :index ]
  end

  resources :categories do
    resources :facilities, only: [ :show ]
  end

  resources :facilities do
    resources :reviews, only: [ :new, :create, :show ]
    collection do
      get :search
    end
  end

get "/community", to: "channels#community"

>>>>>>> 352778225ee44030a9562b99723b0e451ad1e16e
end
