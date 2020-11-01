require 'rails_helper'

describe 'admin changes rate', type: :system do

it 'admin changes rate and amount of all products also changes' do
  @product = Spree::Product.first
  Spree::Price.create(variant_id: @product.default_variant.id, currency: "UAH", role_id: Spree::Role.find_by(name: "rozdrib").id, product_id: @product.id, amount_usd: 1)
  Spree::Price.create(variant_id: @product.default_variant.id, currency: "UAH", role_id: Spree::Role.find_by(name: "opt").id, product_id: @product.id, amount_usd: 1)
  Spree::Price.create(variant_id: @product.default_variant.id, currency: "UAH", role_id: Spree::Role.find_by(name: "gold").id, product_id: @product.id, amount_usd: 1)
  Spree::Price.create(variant_id: @product.default_variant.id, currency: "UAH", role_id: Spree::Role.find_by(name: "vip").id, product_id: @product.id, amount_usd: 1)
  Spree::Price.create(variant_id: @product.default_variant.id, currency: "UAH", role_id: Spree::Role.find_by(name: "vip1").id, product_id: @product.id, amount_usd: 1)
  Spree::Price.create(variant_id: @product.default_variant.id, currency: "UAH", role_id: Spree::Role.find_by(name: "vip2").id, product_id: @product.id, amount_usd: 1)
  visit "/"
  within('#top-nav-bar') do
  find(class: "login_out").click
end
sleep 10
  within('#password-credentials') do
  fill_in 'spree_user_email', with: "spree@example.com"
  fill_in "spree_user_password", with: "spree123"
end
click_button("Увійти")
visit "/admin/products"
within('#fill_rate') do
fill_in 'rate', with: 10.00
click_button("Оновити курс")
end
p Spree::Price.last
visit "/products"
sleep 10
product = find("#product_1")
expect(product).to have_content 10.00
end
end
