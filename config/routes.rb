Rails.application.routes.draw do

  devise_for :humans, :controllers => { :omniauth_callbacks => "humans/omniauth_callbacks" }

  get '/humans/:id', to: 'humans#profile', as: 'humans'

  get 'publics/login'
  get 'publics/redirect'

  devise_for :users

  patch 'templates/update/:id', to: 'templates#update', as: 'template_update' 
  get 'templates/editor/:type', to: 'templates#editor', as: 'template_editor'
  get 'templates/preview/:id', to: 'templates#show', as: 'template_show'

  get 'schedules/:id/edit', to: 'schedules#edit', as: 'schedules_edit'
  get 'schedules/new'
  post 'schedules/create', to: 'schedules#create', as: 'schedules_create'
  patch 'schedules/update', to: 'schedules#update', as: 'schedules_update'

  get 'panels/dashboard'
  get 'panels/leaderboard/:filter/:order', to: 'panels#leaderboardfilter', as: 'leaderboard_filter'
  get 'panels/loginpage'
  get 'panels/welcomepage'
  get 'panels/emailinbox'
  get 'panels/emailblast'
  get 'panels/emailschedule'
  get 'panels/settings'
  get 'panels/loader'
  patch 'panels/settings/update', to: 'panels#settingsupdate', as: 'panels_settingsupdate'
  post 'panels/emailblast/create', to: 'panels#emailblastcreate', as: 'panels_emailblast_create'

  root 'fronts#home'
  get 'fronts/howitworks'
  get 'fronts/pricing'
  get 'fronts/caferestaurant'
  get 'fronts/nightclubbar'
  get 'fronts/getstarted'

  get '/:id/login', to: 'publics#login', as: 'public_login' #hotspot portal
  get '/:id/welcome', to: 'publics#redirect', as: 'public_redirect' #hotspot redirect

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
