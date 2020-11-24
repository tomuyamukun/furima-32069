Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  #ルートパスにアクセスしたときindexアクションを呼び起こす
  root to: 'items#index'
  resources :users, only: [:edit, :update]

end
