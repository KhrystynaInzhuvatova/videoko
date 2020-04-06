class AddRelatedToProduct < SpreeExtension::Migration[4.2]
  def change
    add_column :spree_products, :related, :text
  end
end
