Rails.application.routes.draw do

  get 'users/create'

  get 'users/show'

  resources :wikis

  get 'about' => 'welcome#about'

  root 'welcome#index'

  devise_for :users

end
