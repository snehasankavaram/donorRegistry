Rails.application.routes.draw do
  get 'organizations/index'

  get 'organizations/show'

  get 'organizations/new'

  get 'sessions/new'

  get 'signup' => 'users#new'

  get 'pledges' => 'pledges#index'

  get    'login'   => 'sessions#new', as: 'login_path'
  post   'login'   => 'sessions#create'
  get    'logout'  => 'sessions#destroy'

  get 'organizations' => 'organizations#index'





  get 'organizations/:name' => 'organizations#view'

  get 'pledge' => 'pledges#new'
  post 'pledge' => 'pledges#create'

  get 'organizations/pledges/new' => 'pledges#new'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  post 'users/create' => 'users#create'

  get 'users/show' => 'users#show'

  resources :users
  resources :sessions

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
