Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items do
    resources :bookings, only: [:new, :create, :edit]
  end
  get "/my_offers", to: 'dashboard#my_offers'



end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
