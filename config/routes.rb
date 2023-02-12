Rails.application.routes.draw do
  devise_for :users
  root to: "imaginary_friends#index"

  # get "my_rents", to: "pages#rents", as: :rents

  resources :imaginary_friends do
    resources :reviews, only: %i[create destroy]
    member do
      get :my_friends_index
    end
  end
  resources :bookings, only: %i[create index show] do
    member do
      get :accept, :decline
    end
  end
end
