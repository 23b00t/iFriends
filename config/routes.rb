Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "/my rents", to: "home#my_rents"

  resources :imaginary_friends
  resources :bookings, only: %i[create index show] do
    member do
      get :accept, :decline
    end
  end
end
