class AddAmountUsdToPrice < SpreeExtension::Migration[4.2]
  def change
    add_column :spree_prices, :amount_usd, :decimal, precision: 10, scale: 2, default: nil
  end
end
