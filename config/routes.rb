Rails.application.routes.draw do
  root to: 'blogs#index'
  resources :blogs do
    post :new_confirm, on: :collection
    patch :edit_confirm, on: :member
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
