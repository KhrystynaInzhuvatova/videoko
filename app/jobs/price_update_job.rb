class PriceUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Spree::Product.all.each do |product|
      product.prices.each do |price|
      price.update!(updated_at: Time.now)
    end
  end
end
end
