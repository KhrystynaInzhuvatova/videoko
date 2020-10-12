config = {

}

if File.exists?("config/elasticsearch.yml")
  config.merge!(YAML.load_file("config/elasticsearch.yml")[Rails.env].deep_symbolize_keys)
end

Searchkick.client =
  Elasticsearch::Client.new(config) 
