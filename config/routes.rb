Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items do
    resources :bookings, only: :create
  end

  resources :bookings, only: :destroy

  get "/my_offers", to: 'dashboard#my_offers'
  get "/my_bookings", to: 'dashboard#my_bookings'



end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
