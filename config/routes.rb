Rails.application.routes.draw do

  get 'uploads/create'

  resources :users

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  resources :pages
  resources :templates
  resources :images, only: [:create, :destroy]
  post 'uploads' => 'uploads#create'
root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
