Rails.application.routes.draw do

  mount Spree::Core::Engine, at: '/'
  Spree::Core::Engine.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
    get "posts", controller: "posts", action: "index"
    get "post/:id", controller: "posts", action: "show", as: :post
  namespace :admin do
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
