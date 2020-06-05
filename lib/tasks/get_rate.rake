require 'uri'
require 'net/http'
require 'net/https'
require 'json'
namespace :rate_for_price do
  desc 'Get rate of USD from NBU'
  task get_rate: :environment do
    uri = URI.parse("https://bank.gov.ua/NBU_Exchange/exchange?json")
    Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
      request = Net::HTTP::Get.new uri
      response = http.request request
      response_http =JSON.parse(response.body)
      rate = response_http.select{|c|c["CurrencyCodeL"] == "USD"}.first["Amount"]
      Spree::Config[:rate] = rate
      p Spree::Config[:rate]
    end
  end
end
