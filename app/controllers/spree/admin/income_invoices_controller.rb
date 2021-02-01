module Spree
  module Admin
    class IncomeInvoicesController < Spree::Admin::BaseController

      def new_income
        @mutual = params[:mutual_id]
        @income_invoice = Spree::IncomeInvoice.new()
      end

      def create_income
        income_usd = params[:income_invoice][:income_usd].to_f
        income_uah = income_usd*Spree::Config[:rate]
        mutual_settlement = Spree::MutualSettlement.find(params[:income_invoice][:mutual_settlement])
        new_total_sum_usd = mutual_settlement.total_number_usd - income_usd
        new_total_sum_uah = mutual_settlement.total_number_uah - income_uah
        @income_invoice = Spree::IncomeInvoice.create(
          mutual_settlement_id: mutual_settlement.id,
          name: params[:income_invoice][:name],
          date: params[:income_invoice][:date],
          income_usd: income_usd,
          income_uah: income_uah,
          income_total_usd: new_total_sum_usd,
          income_total_uah: new_total_sum_uah
          )

        mutual_settlement.update(total_number_usd: new_total_sum_usd, total_number_uah: new_total_sum_uah)
        redirect_to admin_show_income_invoice_path(id: @income_invoice.id)
      end

      def show_income
        @income_invoice = Spree::IncomeInvoice.find(params[:id])
      end

      def delete_income
        income_invoice = Spree::IncomeInvoice.find(params[:id])
        new_sum_usd = income_invoice.mutual_settlement.total_number_usd + income_invoice.income_usd
        new_sum_uah = income_invoice.mutual_settlement.total_number_uah + income_invoice.income_uah
        income_invoice.mutual_settlement.update(total_number_usd: new_sum_usd, total_number_uah: new_sum_uah)
        income_invoice.delete
        redirect_to admin_show_mutual_settlement_path(id: income_invoice.mutual_settlement.user.id)
      end

    end
  end
end
