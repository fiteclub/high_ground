Rails.application.routes.draw do
  get 'warriors/duel'
  root 'warriors#duel'
  get 'duel', to: 'warriors#duel'
  resources :warriors do
    get 'select', on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
