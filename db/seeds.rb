require 'csv'

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

CSV.foreach("db/taxonomy.csv", headers: true)do |property|
Spree::Taxonomy.create! property.to_h
end
p "Taxonomy"
Spree::Taxonomy.all.each do |t|
CSV.foreach("db/taxons.csv", headers: true)do |taxon|
tax = Spree::Taxon.new(taxon.to_h)
  tax.update(taxonomy_id:t.id, parent_id: t.id)
    tax.save!
  end
end
p "first taxon"
taxons_last = Spree::Taxon.all
taxons_last.each do |t|
CSV.foreach("db/categories.csv", headers: true)do |taxo|
tax = Spree::Taxon.new(taxo.to_h)
  tax.update(taxonomy_id:t.taxonomy_id, parent_id: t.id )
  tax.save!
  end
end


p "all taxons"
CSV.foreach("db/products_test.csv", headers: true)do |product|
Spree::Product.create! product.to_h
end

p "products"

option_types_attributes = [
  {
    name: 'manufacturer',
    presentation: 'manufacturer',
    position: 1
  },
  {
    name: 'characteristic',
    presentation: 'characteristic',
    position: 2
  },
  {
    name: 'specific',
    presentation: 'specific',
    position: 3
  },
  {
    name: 'color',
    presentation: 'color',
    position: 4
  },
]

option_types_attributes.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

properties = [
  {
    'manufacturer' => 'Dahua',
    'brand' => 'Dahua S',
    'model' => 'JK1002',
    'color' => 'black',
  },
  {
    'manufacturer' => 'Dahua',
    'brand' => 'Dahua V',
    'model' => 'TL9002',
    'color' => 'white',
  }
]

Spree::Taxon.first.children.first.products.each do |product|
  properties.sample.each do |prop_name, prop_value|
    product.set_property(prop_name, prop_value, prop_name.gsub('_', ' ').capitalize)
  end
end

manufacturer_option_type = Spree::OptionType.find_by!(name: 'manufacturer')
characteristic_option_type = Spree::OptionType.find_by!(name: 'characteristic')
specific_option_type = Spree::OptionType.find_by!(name: 'specific')
color_option_type = Spree::OptionType.find_by!(name: 'color')

manufacturer = { dahua: "Dahua", hikvision: "HikVision", orvibo: "ORVIBO", slinex: "Slinex"}

color = {
  white: '#FFFFFF',
  red: '#FF0000',
  black: '#000000',
  brown: '#8B4513',
  green: '#228C22',
  grey: '#808080',
  orange: '#FF8800',
  yellow: '#FFFF00'
}

characteristic = { street: "street", home: "home"  }

specific = { canal16: "16 кан.", canal8: "8 кан.", canal4: "4 кан." }

manufacturer.each_with_index do |manufacturer, index|
  manufacturer_option_type.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

characteristic.each_with_index do |characteristic, index|
  characteristic_option_type.option_values.find_or_create_by!(
    name: characteristic.first,
    presentation: characteristic.last,
    position: index + 1
  )
end

specific.each_with_index do |specific, index|
  specific_option_type.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end

color.each_with_index do |color, index|
  color_option_type.option_values.find_or_create_by!(
    name: color.first,
    presentation: color.last,
    position: index + 1
  )
end
Spree::Product.all.each do |prod|
  prod.update!(available_on: Time.now)
  prod.classifications.create!(taxon_id: Spree::Taxon.find(6).id, product_id: prod.id)
  prod.update!(option_types: [Spree::OptionType.all[0],Spree::OptionType.all[1],Spree::OptionType.all[2],Spree::OptionType.all[3]], available_on: Time.now)
  prod.variants.create do |v|
    v.option_values = [Spree::OptionType.find_by!(name: 'color').option_values.first,
                       Spree::OptionType.find_by!(name: 'manufacturer').option_values.first,
                       Spree::OptionType.find_by!(name: 'characteristic').option_values.first,
                       Spree::OptionType.find_by!(name: 'specific').option_values.first]
  end
end
