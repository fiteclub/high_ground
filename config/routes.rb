Rails.application.routes.draw do
  get 'warriors/duel'
  root 'warriors#select_two_player'
  get 'duel', to: 'warriors#duel'
  get '1p', to: 'warriors#select_one_player'
  get '2p', to: 'warriors#select_two_player'
  get 'cpu', to: 'warriors#select_cpu'
  resources :warriors do
    get 'select', on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
