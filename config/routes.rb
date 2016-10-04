Rails.application.routes.draw do

  get 'users/create'

  get 'users/show'

  resources :wikis

  get 'about' => 'welcome#about'

  root 'welcome#index'

  devise_for :users

  resources :charges, only: [:new, :create]

  get "profile" => "users#show", :as => 'profile'

end
