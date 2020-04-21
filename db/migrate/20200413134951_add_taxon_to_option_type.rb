class AddTaxonToOptionType < SpreeExtension::Migration[4.2]
  def change
    add_column :spree_option_types, :taxon_id, :integer, foreign_key: true
  end
end
