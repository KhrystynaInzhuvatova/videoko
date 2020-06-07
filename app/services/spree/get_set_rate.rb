module Spree
class GetSetRate

def self.rate_import
  begin
    last_rate = Spree::Config[:rate]
    Spree::Config[:last_rate] = last_rate
  uri = URI.parse("https://bank.gov.ua/NBU_Exchange/exchange?json")
  Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
    request = Net::HTTP::Get.new uri
    response = http.request request
    response_http =JSON.parse(response.body)
    rate = response_http.select{|c|c["CurrencyCodeL"] == "USD"}.first["Amount"]
    Spree::Config[:rate] = rate
    end
rescue => error
  puts error.inspect
  last_rate = Spree::Config[:rate]
  Spree::Config[:last_rate] = last_rate
  uri = URI.parse("https://bank.gov.ua/NBU_Exchange/exchange?json")
  Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
    request = Net::HTTP::Get.new uri
    response = http.request request
    response_http =JSON.parse(response.body)
    rate = response_http.select{|c|c["CurrencyCodeL"] == "USD"}.first["Amount"]
    Spree::Config[:rate] = rate
  end
end
end
end
end
