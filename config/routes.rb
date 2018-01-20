Rails.application.routes.draw do

  root 'top#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :blogs do
    post :new_confirm, on: :collection
    patch :edit_confirm, on: :member
  end
  resources :favorites, only: [:index, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
