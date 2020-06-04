require 'net/https'

namespace :rate_for_price do
  desc 'Get rate of USD from NBU'
  task get_rate: :environment do
    url = "https://bank.gov.ua/NBU_Exchange/exchange?json"
    uri = URI(url)
    Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
    response = Net::HTTP.get(uri)
    response_obj = JSON.parse(response)
    rate = response_obj.select{|c|c["CurrencyCodeL"] == "USD"}.first["Amount"]
    Spree::Config[:rate] = rate
    p Spree::Config[:rate]
    end
  end
end
