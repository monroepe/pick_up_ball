Rails.application.routes.draw do


  devise_for :users

  root 'welcome#index'



  resources :locations do
  resources :games
  end

  resources :games


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'


end
