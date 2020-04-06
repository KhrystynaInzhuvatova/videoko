class AddShortTranslationToProduct < SpreeExtension::Migration[4.2]
  def change
    reversible do |dir|
      dir.up do
        Spree::Product.add_translation_fields! short_description: :text
      end

      dir.down do
        remove_column :spree_product_translations, :short_description
      end
    end
  end
end
