class AddShowToProduct < SpreeExtension::Migration[4.2]
  def change
    add_column :spree_products, :show, :boolean, default: true
  end
end
