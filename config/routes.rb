Rails.application.routes.draw do
  resources :locations, except: [:update, :edit, :destroy]
  get 'location/index'
  root 'location#index'
end
