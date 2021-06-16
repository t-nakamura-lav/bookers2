Rails.application.routes.draw do
  root to:'homes#top'
  get 'homes/about'
  devise_for :users
  post 'books' => 'books#create'
  resources :post_images, only: [:new, :create, :index, :show, :destroy
  ]
  resources :books
  resources :users

end
