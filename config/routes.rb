Rails.application.routes.draw do
  devise_for :users
  resources :lists do
  	resources :tasks
  	member do
  		get :done
  	end
  end

  root to: 'lists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
