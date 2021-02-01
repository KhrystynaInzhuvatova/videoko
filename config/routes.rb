Rails.application.routes.draw do

  mount Spree::Core::Engine, at: '/'
  Spree::Core::Engine.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
    get "posts", controller: "posts", action: "index"
    get "post/:id", controller: "posts", action: "show", as: :post
    get "new/:order", controller: "offers", action: "new", as: :new_offer
    post "create", controller: "offers", action: "create"
    get "show/:id", controller: "offers", action: "show", as: :show_offer
    get "show_mutual_settlement", controller: "mutual_settlements", action: "show_mutual_settlement" , as: :show_user_mutual_settlement
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
      get "index", controller: "mutual_settlements", action: "index" , as: :mutual_settlements
      get "show/:id", controller: "mutual_settlements", action: "show", as: :show_mutual_settlement
      get "new/:mutual", controller: "sales_invoices", action: "new", as: :new_sales_invoice
      post "create", controller: "sales_invoices", action: "create", as: :sales_invoices
      delete "delete/:id", controller: "sales_invoices", action: "delete", as: :delete_sales_invoice
      get "show_sales/:id", controller: "sales_invoices", action: "show_sales", as: :show_sales_invoice
      get "new_income/:mutual_id", controller: "income_invoices", action: "new_income", as: :new_income_invoice
      post "create_income", controller: "income_invoices", action: "create_income", as: :income_invoice
      delete "delete_income/:id", controller: "income_invoices", action: "delete_income", as: :delete_income_invoice
      get "show_income/:id", controller: "income_invoices", action: "show_income", as: :show_income_invoice

      get "new_return/:mutual", controller: "return_invoices", action: "new_return", as: :new_return_invoice
      post "create_return", controller: "return_invoices", action: "create_return", as: :return_invoice
      delete "delete_return/:id", controller: "return_invoices", action: "delete_return", as: :delete_return_invoice
      get "show_return/:id", controller: "return_invoices", action: "show_return", as: :show_return_invoice

      get "index_offer", controller: "offers", action: "index_offer", as: :index_offer
      get "show_offer/:id", controller: "offers", action: "show_offer", as: :show_offer
      delete "delete_offer/:id", controller: "offers", action: "delete_offer", as: :delete_offer
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
