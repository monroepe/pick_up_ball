Rails.application.routes.draw do

  devise_for :users

  root 'welcome#index'

  resources :locations do
    resources :games, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  resources :games, only: [] do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :users, only: [] do
    resources :games, only: [:index]
  end

end
