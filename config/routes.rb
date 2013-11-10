Weorder::Application.routes.draw do
  devise_for :users
    
  resources :weixin_messages
  resources :carts

  resources :contacts
  


  resources :shoppings do
    collection do
      post 'new_order'
    end
  end
  resources :shopping_items
  resources :photos do
    member do
      get 'weixin'
    end
  end
  resources :goods_comments
  resources :orders do
    member do
      get 'list'
      end
  end
  resources  :weixin
  resources :product_order_items
  resources :users do
    member do
      get 'shopping'
      get  'history_buy'
    end
  end

  resources :products , :only => ['show','index'] do
    member do
      get 'photo'
      get 'comments'
      get 'buyer'
    end
    
    collection do
      match 'search' => 'products#search', via: [:get, :post], as: :search
    end
  end
  
  root 'home#test'
  get  'old' => "home#index"
  namespace :admin do
    root :to => 'home#index'
    resources :shoppings
    resources :orders
    
    resources :products do
      member do
        get 'photo'
      end
    end
    resources :keywords
    
    resources :reports do
       collection do
         get 'products'
         get 'customers'
       end 
    end 
    
  end
  
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
