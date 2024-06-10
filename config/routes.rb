Rails.application.routes.draw do

  resources :line_translations
  resources :lines do 
    member do
      post 'save_recording'
    end
  end
  resources :line_translations

  resources :fiqh_case_principles
  resources :fiqh_principles do
    collection do
      post 'search', to: 'fiqh_principles#search'
    end
  end
  
  resources :fiqh_cases
  resources :fiqh_cases
  resources :pieces
  resources :conclusions
  resources :scriptures
  resources :triggers
  resources :terms
  resources :figures
  resources :chapters
  devise_for :admins
  resources :cults
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :hadith_collections
  resources :hadith_books
  resources :hadith_chapters
  resources :narrations

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get "/breadcrumbs" => "cults#breadcrumbs"

  get '/timeline' => "pages#timeline"

  get '/all_cached' => "cults#all_cached"

  get '/cached_chapters' => "cults#cached"
  post '/recache_chapters' => "cults#recache"

  get '/chapters/:id/words' => 'chapters#words'

  post "/config_cults" => "cults#config_cults"
  # You can have the root of your site routed with "root"
  root 'pages#home'

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
