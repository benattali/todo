Rails.application.routes.draw do
  devise_for :users
  resources :lists, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :tasks, only: [:new, :create]
  	member do
  		get :done
  		get :undone
  	end
  end

  root to: 'lists#index'
end
