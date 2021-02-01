module Spree
  module Admin
    class MutualSettlementsController < Spree::Admin::BaseController

      def index
        @users = Spree::User.all.reject{|c|c.has_spree_role?(:rozdrib)}.reject{|c|c.has_spree_role?(:admin)}
      end

      def show
        @user = Spree::User.find(params[:id])
        if @user.mutual_settlement.nil?
          @mutual_settlement = Spree::MutualSettlement.create(user: @user)
          @documents = nil
        else
          @mutual_settlement = @user.mutual_settlement
          all_documents = []
          all_documents.push(@user.mutual_settlement.sales_invoices.to_a.flatten(1))
          all_documents.push(@user.mutual_settlement.income_invoices.to_a.flatten(1))
          all_documents.push(@user.mutual_settlement.return_invoices.to_a.flatten(1))
          all_documents_sorted = all_documents.reduce([], :concat)
          @documents = all_documents_sorted.sort_by { |c|c.date}
        end

      end

    end
  end
end
