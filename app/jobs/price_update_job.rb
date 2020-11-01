class PriceUpdateJob < ApplicationJob
  queue_as :default
  retry_on SQLite3::BusyException, wait: 5.seconds, attempts: 3
  retry_on ActiveRecord::Deadlocked, wait: 5.seconds, attempts: 3
  retry_on Net::OpenTimeout, wait: 5.seconds, attempts: 10

  def perform(*args)
    Spree::Product.all.each do |product|
      product.prices.each do |price|
        begin
      price.update!(updated_at: Time.now)
    rescue Exception
        sleep 0.1
        retry
      end
    end
  end
end
end
