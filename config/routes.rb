Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'works#index'
  get '/rank',to: "works#rank", as: 'rank'
  resources :users
  resources :works do
  	resource :like, only: [:create,:destroy]
    resources :comments,only: [:create,:destroy]
  end
  get '/about/ergon',to: "works#about_ergon"
  get '/contact',to: "works#contact"
  get '/about/auther',to: "works#about_auther"
end
