module Spree
  class MutualSettlement < Spree::Base
    belongs_to :user, class_name: 'Spree::User'
    has_many :sales_invoices, class_name: 'Spree::SalesInvoice'
    has_many :income_invoices, class_name: 'Spree::IncomeInvoice'
    has_many :return_invoices, class_name: 'Spree::ReturnInvoice'
  end
end
