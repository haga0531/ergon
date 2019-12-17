Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :users
  resources :works do
  	collection do
  		post 'confirm'
  	end
  	resources :likes, :only => [:create]
  end
  delete '/works/:work_id/likes/:id', to: 'likes#destroy' ,as: :like
end
