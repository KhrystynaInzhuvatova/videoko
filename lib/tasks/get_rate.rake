require 'uri'
require 'net/http'
require 'net/https'
require 'json'
namespace :rate_for_price do
  desc 'Get rate of USD from NBU'
  task get_rate: :environment do
  Spree::GetSetRate.rate_import
  Spree::Product.all.each do |product|
    product.prices.each do |price|
    price.update!(updated_at: Time.now)
  end
end
  puts "all prices updated"
  end
end
