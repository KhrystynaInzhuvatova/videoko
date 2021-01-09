module Spree
  module Admin
    class OffersController < ResourceController

      def index
        @offers = Spree::Offer.select{|c|c.status == "complete"}
      end

      def show
        @offer = Spree::Offer.find(params[:id])
      end

      def delete
        offer = Spree::Offer.find(params[:id])
        offer.delete
        redirect_to admin_index_offer_path
      end

    end
  end
end
