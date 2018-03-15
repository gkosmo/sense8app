Rails.application.routes.draw do


  resources :clusters, only: [:show]
  resources :profiles do
    resources :hobbies, only: [:create, :destroy]
    resources :educations, only: [:create, :destroy]
    resources :languages
    get 'find_cluster', to: "profiles#find_cluster"
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
