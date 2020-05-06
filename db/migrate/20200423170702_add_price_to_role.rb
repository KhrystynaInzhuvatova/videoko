class AddPriceToRole < SpreeExtension::Migration[4.2]
  def change
    add_belongs_to(:spree_prices, :role, default: 3)
  end
end
