MyToons::Application.routes.draw do
  
root :to => 'toons#index'
  devise_for :users 
#devise_for :users, :controllers => {:registrations => "registrations"}

  resources :products
  resources :toons do
    resources :comments, :only => [:create, :destroy]
  end
  match 'dashboard_systemadmin' => "users#systemadmin_dashboard", :as => "dashboard_systemadmin" ,:via => [:delete,:get,:post]
  match 'dashboard_moderator' => "toons#dashboard_moderator", :as => "dashboard_moderator" ,:via => :get
  match 'dashboard_publisher' => "toons#dashboard_publisher", :as => "dashboard_publisher" ,:via => :get
  match 'toons/:id/publish'=>"toons#publish",:as=>:publish
  match 'toons/:id/approve'=>"toons#approve",:as=>:approve
  match 'toons/:id/disapprove'=>"toons#disapprove",:as=>:disapprove
  match 'users/:id/delete'=>"users#delete",:as=>:delete
  # match 'toons/myshow'=>"toons#mtyshow", :as=>:myshow
  match 'myshow' => "toons#myshow", :as => "myshow" ,:via => :get
  resources :users do
    #  match 'users/:id/destroy'=>"users#destroy",:as=>:destroy,:via=>:put
  end

  #  match 'Delete' => "users#destroy", :as => "Delete_user"
  
  # match 'systemadmin_dashboard' => "users#destroy", :as => "sysadmindashboard" ,:via => :get
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
  # match ':controller(/:action(/:id))(.:format)'
end
