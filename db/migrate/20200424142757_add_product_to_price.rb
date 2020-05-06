class AddProductToPrice < SpreeExtension::Migration[4.2]
  def change
    add_belongs_to(:spree_prices, :product)
  end
end
