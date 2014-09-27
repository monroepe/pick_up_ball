Rails.application.routes.draw do


  devise_for :users

  root 'welcome#index'



  resources :locations do
    resources :games
  end




  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'


end
