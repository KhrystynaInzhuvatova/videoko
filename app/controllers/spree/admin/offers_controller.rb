module Spree
  module Admin
    class OffersController < Spree::Admin::BaseController

      def index_offer
        @offers = Spree::Offer.select{|c|c.status == "complete"}
      end

      def show_offer
        @offer = Spree::Offer.find(params[:id])
      end

      def delete_offer
        offer = Spree::Offer.find(params[:id])
        offer.delete
        redirect_to admin_index_offer_path
      end

    end
  end
end
