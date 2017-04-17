Rails.application.routes.draw do
  get 'bookings/new'

  get 'flights/index'
  root'flights#index'
  resources :bookings, only: [:new, :create, :show]
  resources :passengers, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
