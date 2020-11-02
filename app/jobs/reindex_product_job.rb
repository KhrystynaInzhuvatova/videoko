class ReindexProductJob < ApplicationJob
  queue_as :default
  
  def perform(*args)
    begin
      retries ||= 0
    command = "RAILS_ENV=#{ENV["RAILS_ENV"]} bundle exec rake searchkick:reindex CLASS=Spree::Product"
    system(command)
  rescue Exception
    if (retries += 1) < 3
        sleep 1
        retry
      end
      end
  end

end
