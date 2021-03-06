Rails.application.routes.draw do
  devise_for :users
  resources :profiles, except: [:show] do
    put :sort, on: :collection
  end 
  
  get 'profile/:id', to: 'profiles#show', as: 'profile_show'
  get 'profiled', to: 'pages#profiled'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'
  
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
