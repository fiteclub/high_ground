Rails.application.routes.draw do
  root 'warriors#duel'
  resources :warriors do
    get 'pvp', on: :collection
  end
  post 'fart', to: 'duel#fart', as: 'fart'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
