Rails.application.routes.draw do
  devise_for :users
  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :tasks, only: [:new, :create]
  	member do
  		get :done
  		get :undone
  	end
  end

  root to: 'lists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
