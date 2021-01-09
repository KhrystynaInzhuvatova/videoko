Rails.application.routes.draw do

  mount Spree::Core::Engine, at: '/'
  Spree::Core::Engine.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
    get "posts", controller: "posts", action: "index"
    get "post/:id", controller: "posts", action: "show", as: :post
    get "new/:order", controller: "offers", action: "new", as: :new_offer
    post "create", controller: "offers", action: "create"
    get "show/:id", controller: "offers", action: "show", as: :show_offer
    get "create_order/:id", controller: "offers", action: "create_order", as: :create_order
    delete "delete/:id", controller: "offers", action: "delete", as: :delete_offer
    post "offer_address", controller: "offers", action: "offer_address", as: :offer_address
  namespace :admin do
    resources :products do
        member do
          post "related"
          get "related"
          get "related_first"
          resources :volumes
        end
      end
      get "show/:id", controller: "offers", action: "show", as: :show_offer
      get "index", controller: "offers", action: "index", as: :index_offer
      delete "delete/:id", controller: "offers", action: "delete", as: :delete_offer
      get "remove_related/:id_product/:id_related", controller: "products", action: "remove_related",  as: :remove_related
      get "reindex_force", controller: "products", action: "reindex_force",  as: :reindex_force
      post "import", controller: "products", action: "import",  as: :import
      get "settings/index", controller: "settings", action: "index",  as: :settings
      post "settings/change", controller: "settings", action: "change",  as: :change
      get "destroy_video/:id", controller: "products", action: "destroy_video",  as: :destroy_video
      get "search_taxonomy/:id", controller: "products", action: "search_taxonomy",  as: :search_taxonomy
      post "rate", controller: "products", action: "rate", as: :rate
      resources :posts
      get "post/destroy_video/:id", controller: "posts", action: "destroy_video",  as: :post_destroy_video
      get "post/create_ru_form", controller: "posts", action: "create_ru_form",  as: :create_ru_form
      post "post/create_ru", controller: "posts", action: "create_ru",  as: :post_translate
    end
end
end
