Rails.application.routes.draw do
  ######
  #
  #
  # Paths for user flow
  #
  #
  ######


  scope defaults: { format: 'json' } do
    resources :registry_item, only: [:update]
    resources :pledges, only: [:update]
  end

  root 'organizations#index'
  get 'organizations/index'
  get 'organizations/show'
  get 'organizations/new'
  get 'sessions/new'

  post 'users/create' => 'users#create'
  get 'users/show' => 'users#show'

  resources :users
  resources :sessions

  get 'signup' => 'users#new'
  get 'pledges' => 'pledges#index_for_donor'

  get 'orgs/pledges' => 'pledges#index_for_org'

  get    'login'   => 'sessions#new', as: 'login_path'
  post   'login'   => 'sessions#create'
  get    'logout'  => 'sessions#destroy'

  get 'organizations' => 'organizations#index'
  get 'organizations/:name' => 'organizations#view'

  get 'pledge' => 'pledges#new'
  post 'pledge' => 'pledges#create'
  post 'pledge/delete' => 'pledges#delete'

  get 'organizations/pledges/new' => 'pledges#new'

  post 'registry_item/delete' => 'registry_item#delete'


  ######
  #
  #
  # Paths for organization flow
  #
  #
  ######
  get  'orgs/login'   => 'sessions#newOrg'
  post 'orgs/login'   => 'sessions#createOrg'
  get  'orgs/logout'  => 'sessions#destroyOrg'

  get 'orgs/signup'   => 'organizations#new'
  post '/organizations'  => 'organizations#create'

  get 'orgs/donors' => 'users#indexForOrgs' #make sure only for orgs
  get 'orgs/registry' => 'registry_item#itemsForOrgs'

  post '/registry_items' => 'registry_item#create'
  get '/registry_item' => 'registry_item#itemsForOrgs'

  post 'orgs/donors' => 'users#filterDonors', as: 'filter'


  post '/users/message' => 'users#message'

  put '/registry_item' => 'registry_item#update'
  put '/pledge' => 'pledges#update'
  post '/pledge/mark_fulfilled' => 'pledges#mark_fulfilled'

  get '/pledge/search' => 'pledges#search'




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
