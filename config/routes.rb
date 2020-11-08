Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  get "users/show", to: "users#show"
  get "users/out", to: "users#index"
  get "/mypage", to: "users#mypage"
  devise_for :users
  root 'items#index'
  resources :users, only: [:show,:destroy]
  resources :items, only: [:index, :new, :show] do
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
