Searchkick.client =
  Elasticsearch::Client.new(url: Rails.application.credentials[Rails.env.to_sym][:host_search]) 
