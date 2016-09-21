Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

  devise_for :users

>>>>>>> 7aa4330e0ab12d5274100618678eb65c082372bb
end
