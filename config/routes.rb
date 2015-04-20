Consoom::Application.routes.draw do
  resources :invites

  resources :books
  
  match 'recommendations/mobile_search' => 'recommendations#mobile_search', :as => :recommendation_mobile_search
  match 'recommendations/mobile_search_results' => 'recommendations#mobile_search_results', :as => :recommendation_mobile_search_results
  match 'recommendations/already_read' => 'recommendations#already_read', :as => :recommendation_already_read
  match 'recommendations/not_interested' => 'recommendations#not_interested', :as => :recommendation_not_interested
  match 'recommendations/buy_now' => 'recommendations#buy_now', :as => :recommendation_buy_now
  resources :recommendations

  match 'amazon_items/amazon_favorite' => 'amazon_items#amazon_favorite', :as => :amazon_favorite
  resources :amazon_items

  resources :recommendation_requests

  resources :line_items

  resources :book_lists


  match 'friendships/accept' => 'friendships#accept', :as => :accept_request
  match 'friendships/decline' => 'friendships#decline', :as => :decline_request
  match 'friendships/remove' => 'friendships#remove', :as => :remove_friendship
  match 'friendships/cancel' => 'friendships#cancel', :as => :cancel_request
  resources :friendships

  get "users/index"
  match 'users/add_connection' => 'users#add_connection', :as => :add_connection
  match 'users/remove_connection' => 'users#remove_connection', :as => :remove_connection
  match 'users/add_multiple_connections' => 'users#add_multiple_connections', :as => :add_multiple_connections

  match 'users/welcome' => 'users#welcome', :as => :users_welcome

  devise_for :users, :controllers => { :registrations => "registrations" }
  match "users/:id" => "users#show", :as => :user_show

  match 'book_lists:id' => 'book_lists#show'


  get "main/index"




  root :to => 'main#index'



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
