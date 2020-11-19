Rails.application.routes.draw do
  root 'warriors#index'
  resources :warriors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
