Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  get "users/show", to: "users#show"
  get "users/out", to: "users#index"
  get "/mypage", to: "users#mypage"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  resources :users, only: [:show,:destroy]
  resources :items, only: [:index, :new, :show]
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
