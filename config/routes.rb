Rails.application.routes.draw do
  resources :feedbacks
  resources :activity_processes
  resources :selective_processes
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  root  'welcome#home'

  get "home/logout"
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/welcome/about',   to: 'welcome#about',   via: 'get'
  match '/rpg',     to: 'rpg#index', via: 'get'
  match '/rpg/index', to: 'rpg#show', via: 'get'
  match '/index', to: 'welcome#index', via: 'get'

  get '/processos', to: 'selective_processes#index'
  get '/processos/criar', to: 'selective_processes#new'
  get '/atividades', to: 'activity_processes#index'
  get '/atividades/criar', to: 'activity_processes#new'
  get '/atividades/:id', to: 'activity_processes#show'


  # root :to => redirect('/welcome')
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
