Rails.application.routes.draw do

  scope '/api' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      #scope '/:idtype' do
        
        scope '/topics' do
          get '/' => 'api_topics#index'
          post '/' => 'api_topics#create'
          scope '/:id' do
            get '/' => 'api_topics#show'
            put '/' => 'api_topics#update', :as => "update_topic"
            scope '/questions' do
              get '/' => 'api_questions#index'
              post '/' => 'api_questions#create'
              #scope '/:qid' do
              #  get '/' => 'api_questions#show'
              #  put '/' => 'api_questions#update'
              #end
            end
          end
        end
        
        scope '/questions' do
          scope '/:id' do
            get '/' => 'api_questions#show'
            put '/' => 'api_questions#update'
            scope '/answers' do
              get '/' => 'api_answers#index'
              post '/' => 'api_answers#create'
            end
          end
        end
        
        scope '/answers' do
          get '/' => 'api_answers#index'
          post '/' => 'api_answers#create'
          scope '/:id' do
            get '/' => 'api_answers#show'
            put '/' => 'api_answers#update'
          end
        end
        
        scope '/identities' do
          post '/' => 'api_identities#create'
        end
        
        scope '/users' do
          get '/' => 'api_users#index'
          #post '/' => 'api_topics#create'
          scope '/:id' do
            get '/' => 'api_users#show'
            #put '/' => 'api_users#update'
          end
        end
      #end
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
