Basisapp::Application.routes.draw do
  get "album/show"
  get "album/edit"
  get "album/destroy"
  get "album/create"
  devise_for :users

  resources :artists do 
	resources :songs, except: :show
  resources :albums
  end 
  resources :posts do
    resources :comments, except: [:show,:edit,:update,:index]
  end  
  
  resources :listened_songs, except: [:destroy, :edit, :update, :show]
  get 'listened_songs/:artist_id/new' => 'listened_songs#new', as: :new_listened_song_with_artist

  #Routes for Songs, which should be accessed via their according artists.
  #get 'artists/:artist_id/songs/:song_id' => 'song#show'#, as: :show_song
  #get 'artists/:artist_id/songs/new' => 'song#new'#, as: :new_song
  #get 'artists/:artist_id/songs/:song_id/edit' => 'song#edit'#, as: :edit_song
  #post 'artists/:artist_id' => 'song#create'#, as: :create_song
  #patch 'artists/:artist_id/songs/1' => 'song#update'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'posts#index'

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
