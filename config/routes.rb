Rails.application.routes.draw do
  
  
  # Added by Koudoku.
  mount Koudoku::Engine, at: 'koudoku'
  scope module: 'koudoku' do
    get 'pricing' => 'subscriptions#index', as: 'pricing'
  end


  resources :academies
  resources :feeds
  resources :courses
  resources :comments
  resources :topics
  resources :answers
  resources :appear_ins
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
 
  resources :users do
    resources :courses do
      post 'add', to: 'courses#add'
    end
    get  'show', to: 'users#show'
    post 'follow',   to: 'socializations#follow'
    post 'unfollow', to: 'socializations#unfollow'
  end

  resources :courses, only: [:new, :create, :edit, :update, :destroy] do
    post 'follow',   to: 'socializations#follow'
    post 'unfollow', to: 'socializations#unfollow'
  end

  
  resources :answers do
    put "upvote", to: "answers#upvote"
    put "downvote", to: "answers#downvote"
  end

  resources :topics do
    post 'like',   to: 'socializations#like'
    post 'unlike', to: 'socializations#unfollow'
    post 'toggle_like', to: 'socializations#toggle_like'
    resources :appear_ins
    resources :answers
    resources :comments
  end

  get 'search/course' => 'search#course'
  get 'search/topic' => 'search#topic'
  get 'search/academy' => 'search#academy'
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
