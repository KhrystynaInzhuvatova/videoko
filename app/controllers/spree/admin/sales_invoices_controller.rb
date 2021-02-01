module Spree
  module Admin
    class SalesInvoicesController < Spree::Admin::BaseController


      def new
        @mutual = params[:mutual]
        @sales_invoice = Spree::SalesInvoice.new()
      end

      def create
        if !params[:sales_invoice][:invoice_items_attributes].nil?
        @sales_invoice = Spree::SalesInvoice.create(
          mutual_settlement_id: params[:sales_invoice][:mutual_settlement],
          name: params[:sales_invoice][:name],
          date: params[:sales_invoice][:date]
          )
        params[:sales_invoice][:invoice_items_attributes].each do |item|
        Spree::InvoiceItem.create(name: item[1]["name"], quantity: item[1]["quantity"], price: item[1]["price"], sales_invoice_id: @sales_invoice.id)
      end
      @sales_invoice.invoice_items.each do |item|
        item.update(final_price: item.quantity*item.price)
      end
      sum = @sales_invoice.invoice_items.map{|c|c.final_price}.sum
      sum_uah = sum*Spree::Config[:rate]
      new_total_sum = @sales_invoice.mutual_settlement.total_number_usd + sum
      new_total_sum_uah = @sales_invoice.mutual_settlement.total_number_uah + sum_uah
      @sales_invoice.update(debt_usd: sum, debt_uah: sum_uah, debt_total_usd: new_total_sum, debt_total_uah: new_total_sum_uah)
      @sales_invoice.mutual_settlement.update(total_number_usd: new_total_sum, total_number_uah: new_total_sum_uah)
      redirect_to admin_show_sales_invoice_path(id: @sales_invoice.id)
      else
        flash[:error] = "має бути доданий хоча б один товар"
        redirect_to admin_new_sales_invoice_path(mutual: params[:sales_invoice][:mutual_settlement])
      end
      end

      def show_sales
        @sales_invoice = Spree::SalesInvoice.find(params[:id])
      end

      def delete
        sales_invoice = Spree::SalesInvoice.find(params[:id])
        new_sum_usd = sales_invoice.mutual_settlement.total_number_usd - sales_invoice.debt_usd
        new_sum_uah = sales_invoice.mutual_settlement.total_number_uah - sales_invoice.debt_uah
        sales_invoice.mutual_settlement.update(total_number_usd: new_sum_usd, total_number_uah: new_sum_uah)
        sales_invoice.delete
        redirect_to admin_show_mutual_settlement_path(id: sales_invoice.mutual_settlement.user.id)
      end


    end
  end
end
