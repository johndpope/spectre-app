SpectreApp::Application.routes.draw do
  get "incident_monitors/index"

  get "incident_monitors/show"

  get "actions/activity"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :case_files, only: [:index, :show, :update]
  resources :incident_monitors, only: [:index, :show]

  root to: 'static_pages#home'

  match '/create', to: 'case_files#create'
  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/activity',   to: 'actions#activity'
  match '/about',   to: 'static_pages#about'
  match '/support', to: 'static_pages#support'
  match '/contact', to: 'static_pages#contact'

  match '/my_cases', to: 'case_files#my_cases'
  match '/closed_cases', to: 'case_files#closed_cases'

  match 'comment', to: 'actions#comment'
  match 'transfer', to: 'actions#transfer'
  match 'pending_close', to: 'actions#request_close'
  match 'confirm_close', to: 'actions#confirm_close'
  match 'reject_close', to: 'actions#reject_close'
  match 'reopen', to: 'actions#reopen'

  match "/incident_monitors/bid_layering_monitor_settings",
        to: 'bid_layering_monitor_settings#modify'
  match "/incident_monitors/ask_layering_monitor_settings",
        to: 'ask_layering_monitor_settings#modify'


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
