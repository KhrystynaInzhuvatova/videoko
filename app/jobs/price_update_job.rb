class PriceUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    rate = Spree::Config[:rate]
    Spree::Price.all.each do |price|
      price.run_callbacks(:update)
  end
  end
end
