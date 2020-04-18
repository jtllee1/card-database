Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :booster_sets, only: [:index] do
    resources :booster_packs, only: [:index]
  end
  resources :cards, only: [:index]
end
