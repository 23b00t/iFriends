Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :imaginary_friends do
    resources :bookings, only: %i[create index]
  end
end
