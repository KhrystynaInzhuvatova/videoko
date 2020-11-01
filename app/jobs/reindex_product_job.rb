class ReindexProductJob < ApplicationJob
  queue_as :default
  retry_on Net::OpenTimeout, wait: 5.seconds, attempts: 10

  def perform(*args)
    begin
    command = "RAILS_ENV=#{ENV["RAILS_ENV"]} bundle exec rake searchkick:reindex CLASS=Spree::Product"
    system(command)
  rescue Exception
      sleep 0.1
      retry
    end
  end

end
