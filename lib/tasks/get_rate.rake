require 'uri'
require 'net/http'
require 'net/https'
require 'json'
namespace :rate_for_price do
  desc 'Get rate of USD from NBU'
  task get_rate: :environment do
  Spree::GetSetRate.rate_import
  rate = Spree::Config[:rate]
  Spree::Price.all.each do |price|
    price.run_callbacks(:update)
  end
  puts "all prices updated"
  end
end
