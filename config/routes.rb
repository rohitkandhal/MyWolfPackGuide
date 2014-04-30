MyWolfPackGuide::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#login'

  # Users routes
  post '/' => 'users#login'
  get 'users/new' => 'users#new'
  post 'users/new' => 'users#new'

  get '/home_page' => 'users#home_page'

  get 'users/logout' => 'users#logout'

  get '/admin_home' => 'users#admin_home'
  get 'users/Delete'  => 'users#Delete'
  get 'users/Edit' => 'users#Edit'
  post 'users/Edit' => 'users#Edit'
  get 'users/update' => 'users#update'
  post 'users/update' => 'users#update'
  get 'users/Submit' => 'users#Submit'
  post 'users/Submit' => 'users#Submit'
  post '/admin_home' => 'users#admin_home'
  get 'users/delete'  => 'users#delete'
  get 'users/edit' => 'users#edit'
  get 'users/updatec' => 'users#updatec'
  post 'users/updatec' => 'users#updatec'
  get 'users/Savec' => 'users#Savec'
  post 'users/Savec' => 'users#Savec'
  get 'users/edituser' => 'users#edituser'
  post 'users/edituser' => 'users#edituser'
  get 'users/updateuser' => 'users#updateuser'
  post 'users/updateuser' => 'users#updateuser'

  get "category/edit" => 'category#edit'
  post 'category/updateCategory' => 'category#updateCategory'
  get 'category/deleteConfirm' => 'category#deleteConfirm'
  post 'category/delete' => 'category#delete'
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
