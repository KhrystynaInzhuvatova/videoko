require 'rails_helper'

describe 'admin changes rate', type: :system do

it 'admin changes rate and amount of all products also changes' do
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
within('#content') do
fill_in 'rate', with: 90.00
click_button("Оновити курс")
end
sleep 25
expect(Spree::Product.first.prices.first.amount).to eql 90.00
end
end
