Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :posts, :products, :orders
  
  resources :shops, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end
  
  resources :favorites, only: [:index]
  
  get 'shops/result' => 'shops#result', as: "result"
  get '/pay/:id' => 'shops#pay'
  get  '/near_shop' => 'shopw#near_shop'
  post '/write'=> 'shops#write'
  get "/location" => "shops#location"
  post 'shops/near_shop'
    
  # get '/comments/create/:shop_id' => 'comments#create'
  # post '/show_product/:shop_id/comments/destroy/:id' => 'comments#destroy'
  # get '/comments/index/:shop_id' => 'comments#index', as: "show_comments"
  
  # get 'show_product/favorites/index/:shop_id' => 'favorites#index', as: "favorite"
  # get 'favorites/show_favorite' => 'favorites#show_favorite', as: "show_favorite"
  # get 'show_product/favorites/destroy/:shop_id' => 'favorites#destroy'
  
  get 'products/index' => 'products#index'
  
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  
  get 'line_items/check_order' => 'line_items#check_order', as: "my_order"
  get 'line_items/new/:id' => 'line_items#new', as: "line_items_new"
  get 'line_items/okay' => 'line_items#okay', as: "okay"
  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post '/line_items/:product_id' => "line_items#create"
  post 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"
  
  get 'okay/accept/:id' => 'line_items#accept',as: "accept"
  get 'okay/deny/:id' => 'line_items#deny',as: "deny"
  
  get '/orders/index' => "orders#index"
  
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
