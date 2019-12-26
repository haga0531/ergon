Rails.application.routes.draw do
  devise_for :users
  root 'works#index'
  resources :users
  resources :works do
  	resources :likes, only: [:create,:destroy]
    resources :comments,only: [:create,:destroy]
  end
  # delete '/works/:work_id/likes/:id', to: 'likes#destroy' ,as: :like
end
