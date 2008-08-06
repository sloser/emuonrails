ActionController::Routing::Routes.draw do |map|
  
  map.logout    '/logout',    :controller => 'sessions',  :action => 'destroy'
  map.login     '/login',     :controller => 'sessions',  :action => 'new'
  map.register  '/register',  :controller => 'users',     :action => 'create'
  map.signup    '/signup',    :controller => 'users',     :action => 'new'  
  
  map.archive    '/archive',  :controller => 'articles',  :archive => 1

  map.disorder  '/articles/update_positions',  :controller => 'articles',  :action => 'update_positions'  
  map.resources :articles
  map.resources :categories  
  map.resources :users
  map.resource  :session
  
  map.autocomplete    'articles/auto_complete_for_tags_tag', :controller => 'articles', :action => 'auto_complete_for_tags_tag'  
  map.settings        '/settings',                     :controller => 'settings', :action => 'index'  
  map.comment         '/frontend/add-comment',         :controller => 'frontend', :action => 'add_comment'
  map.tiny_mce        '/tiny_mce_photos',              :controller => 'tiny_mce_photos'
  map.tiny_mce_create '/tiny_mce_photos/create',       :controller => 'tiny_mce_photos', :action => 'create'
  map.send_mail       '/sendmail',                     :controller => 'frontend', :action => 'send_mail'                     
  
  map.tag_overview    '/tag/:tag',                     :controller => 'frontend', :action => 'overview'
  map.overview        ':category_code',                :controller => 'frontend', :action => 'overview'
  map.view            ':category_code/:article_code',  :controller => 'frontend', :action => 'view' 
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => 'frontend'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
