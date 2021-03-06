Rails.application.routes.draw do

  mount Spree::Core::Engine, at: '/'
  Spree::Core::Engine.routes.draw do
  namespace :admin do
      get "destroy_video/:id", controller: "products", action: "destroy_video",  as: :destroy_video
      get "search_taxonomy", controller: "products", action: "search_taxonomy",  as: :search_taxonomy
      get "rate", controller: "products", action: "rate"
  end
end
end
