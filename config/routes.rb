Rails.application.routes.draw do
  
  # get 'spoils/index'

  # get 'spoils/show'

  # get 'spoils/new'

  # get 'spoils/edit'

  # get 'spoils/create'

  # get 'spoils/update'

  # get 'spoils/destroy'

  get 'home/index'

  devise_for :users
  
  # get 'list_items/create'

  # get 'list_items/destroy'

  # get 'list_items/complete'

  get 'welcome/index'

  resources :spoils do
    member do
      patch :complete
    end
  end

  resources :lists do
    resources :list_items do
      member do
        patch :complete
      end
    end
  end

  authenticated :user do
    root "home#index", as: "authenticated_root"
  end

  root 'welcome#index'

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
