Rails.application.routes.draw do
  root 'works#index'
  
  devise_for :users

  resources :works do
  	patch 'completion', on: :member
  	put 'completion', on: :member
  end
end
