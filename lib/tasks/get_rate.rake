require 'net/https'

namespace :rate_for_price do
  desc 'Get rate of USD from NBU'
  task get_rate: :environment do
  url = "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange/?json"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  response_obj = JSON.parse(response)
  rate = response_obj.select{|c|c["cc"] == "USD"}.first["rate"]
  Spree::Config[:rate] = rate
   p Spree::Config[:rate]
end
end
