class AddRoleIdPriceToLineItem < SpreeExtension::Migration[4.2]
  def change
    add_column :spree_line_items, :role_id_price, :integer
  end
end
