Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "/my rents", to: "pages#my_rents"

  resources :imaginary_friends do
    resources :reviews, only: %i[create destroy]
  end
  resources :bookings, only: %i[create index show] do
    member do
      get :accept, :decline
    end
  end
end
