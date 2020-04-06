Rails.application.routes.draw do
  
  mount Spree::Core::Engine, at: '/'
  Spree::Core::Engine.routes.draw do
  namespace :admin do
      get "destroy_video/:id", controller: "products", action: "destroy_video",  as: :destroy_video
  end
end
end
