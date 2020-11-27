Rails.application.routes.draw do
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
  resources :items, only: [:index, :new, :create, :show, :destroy] do
    # 商品購入確認ページのフロントエンド確認のため仮置き
    collection do
      get 'buy'
    end
  end
  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  resources :purchases, only: [:index] do
    member do
      get 'pay_index', to: 'purchases#pay_index'
      post 'pay', to: 'purchases#pay'
      get 'done', to: 'purchases#done'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end