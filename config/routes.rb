Rails.application.routes.draw do
  # deviseを使用する際にURLとしてusersを含むこと
  devise_for :users
  root 'post_images#index'
  # onlyは、生成するルーティングを限定するオプション
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  	# resourcesを単数のresourceにするとそのコントローラーのidがリクエストに含まれなくなります
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
