Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  get 'about'=> 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :books,only:[:new,:create,:index,:show,:update,:destroy]
resources :users, only: [:show, :edit,:index, :update, ]
end
