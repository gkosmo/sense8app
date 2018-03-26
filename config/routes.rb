Rails.application.routes.draw do
mount ActionCable.server => "/cable"
  get 'i_am_still_here', to: "pages#i_am_still_here"
  get 'groups/create'

  resources :clusters, only: [:show] do
        get "get_cluster_online", to: "clusters#get_cluster_online"
        post "cluster_message", to: "clusters#cluster_message"
        resources :groups, only: [:create] do
            post "cluster_message", to: "groups#group_message"
        end
  end
  resources :profiles, only: [:show, :new, :create] do
    resources :hobbies, only: [:create, :destroy]
    resources :educations, only: [:create, :destroy]
    resources :languages
    get 'find_cluster', to: "profiles#find_cluster"
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
