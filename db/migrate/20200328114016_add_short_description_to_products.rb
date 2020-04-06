class AddShortDescriptionToProducts < SpreeExtension::Migration[4.2]
  def change
    add_column :spree_products, :short_description, :text 
  end
end
