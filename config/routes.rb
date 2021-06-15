Rails.application.routes.draw do
  get 'users/show'
  root to:'homes#top'
  devise_for :users
  resources :books
  resources :post_images, only: [:new, :create, :index, :show, :destroy
  ]

  resources :users

end
