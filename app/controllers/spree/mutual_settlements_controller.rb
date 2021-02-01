module Spree
  class MutualSettlementsController < Spree::StoreController
    before_action :check_user

    def show_mutual_settlement
      if !spree_current_user.mutual_settlement.nil?
        @mutual_settlement = spree_current_user.mutual_settlement
        all_documents = []
        all_documents.push(spree_current_user.mutual_settlement.sales_invoices.to_a.flatten(1))
        all_documents.push(spree_current_user.mutual_settlement.income_invoices.to_a.flatten(1))
        all_documents.push(spree_current_user.mutual_settlement.return_invoices.to_a.flatten(1))
        all_documents_sorted = all_documents.reduce([], :concat)
        @documents = all_documents_sorted.sort_by { |c|c.date}
      else
        flash[:notice] = Spree.t(:empty)
        redirect_to "/account"
      end
    end

    private

    def check_user
      if spree_current_user.has_spree_role?("rozdrib")
        redirect_to root_path
      end
    end

  end
end
