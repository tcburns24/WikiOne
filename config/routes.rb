Rails.application.routes.draw do

  get 'users/create'

  get 'users/show'

  resources :wikis

  get 'about' => 'welcome#about'

  root 'welcome#index'

  devise_for :users

  resources :charges, only: [:new, :create]

  get "profile" => "users#show", :as => 'profile'

  post "users/downgrade" => "users#downgrade", :as => "downgrade"

  resources :collaborators, only: [:create, :destroy]

end
