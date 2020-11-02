class PriceUpdateJob < ApplicationJob
  queue_as :default
  
  def perform(*args)
    Spree::Product.all.each do |product|
      product.prices.each do |price|
        begin
          retries ||= 0
      price.update!(updated_at: Time.now)
    rescue Exception
      if (retries += 1) < 3
          sleep 1
          retry
        end
        end
    end
  end
end
end
