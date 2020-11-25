module Spree
  module Admin
    class Spree::Admin::VolumesController < Spree::Admin::BaseController

      def index
        @product = Product.friendly.find(params[:id])
        @product_id = @product.id
      end

      def create
        @product = Product.friendly.find(params[:id])
        @volume = Spree::Volume.create!(product_id: params[:product_id],  name: params[:name])
        params[:images].each do |im|
        @volume.images.attach(im)
      end
        render "index"
      end


      def destroy
        @volume = Spree::Volume.find(params[:volume])
        @volume.images.each do |im|
          im.purge
        end
        @product = @volume.product
        @volume.delete
        redirect_to spree.edit_admin_product_url(@product)
      end

  end
 end
end
