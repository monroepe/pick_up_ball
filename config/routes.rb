Rails.application.routes.draw do

  devise_for :users

  root 'welcome#index'

  resources :locations do
    resources :games
  end

  resources :games do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end

end
