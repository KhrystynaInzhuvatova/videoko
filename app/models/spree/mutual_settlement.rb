module Spree
  class MutualSettlement < Spree::Base
    belongs_to :user, class_name: 'Spree::User'
    has_many :sales_invoices, class_name: 'Spree::SalesInvoice', dependent: :destroy
    has_many :income_invoices, class_name: 'Spree::IncomeInvoice', dependent: :destroy
    has_many :return_invoices, class_name: 'Spree::ReturnInvoice', dependent: :destroy
    
  end
end
