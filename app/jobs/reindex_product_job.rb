class ReindexProductJob < ApplicationJob
  queue_as :default

  def perform(*args)
    command = "RAILS_ENV=production bundle exec rake searchkick:reindex CLASS=Spree::Product"
    system(command)
  end

end
