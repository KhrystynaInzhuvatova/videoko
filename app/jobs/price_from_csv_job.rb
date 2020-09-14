require 'csv'
require 'open-uri'
class PriceFromCsvJob < ApplicationJob
  queue_as :default

  def perform(csv_path)
    csv_file = open(csv_path,'rb:UTF-8')
    CSV.foreach(csv_file, headers: true, skip_blanks: true)do |t|
    if !Spree::Variant.find_by(sku: t['id']).nil?
       price_rozdrib = Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "rozdrib").id)}
       price_rozdrib.each{|price| price.update!(amount_usd: t["6"])}
       price_opt = Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "opt").id)}
       price_opt.each{|price| price.update!(amount_usd: t["5"])}
       price_gold = Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "gold").id)}
       price_gold.each{|price| price.update!(amount_usd: t["4"])}
       price_vip = Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "vip").id)}
       price_vip.each{|price| price.update!(amount_usd: t["3"])}
       price_vip2 = Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "vip2").id)}
       price_vip2.each{|price| price.update!(amount_usd: t["2"])}
       price_vip1 = Spree::Variant.where(sku: t['id']).map{|variant| variant.prices.find_by(role_id: Spree::Role.find_by(name: "vip1").id)}
       price_vip1.each{|price| price.update!(amount_usd: t["1"])}
     end
    end
end
end
