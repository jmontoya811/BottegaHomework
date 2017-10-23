Rails.application.routes.draw do
  devise_for :users
  resources :profiles
  
  get 'profile', to: 'pages#profile'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
