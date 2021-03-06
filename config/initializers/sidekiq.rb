Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDISTOGO_URL'] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV["REDISTOGO_URL"]}
end

ENV['REDIS_PROVIDER'] = ENV['REDISTOGO_URL'] || '127.0.0.1:6379'


require 'sidekiq'
require 'sidekiq/web'

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == ["admin", "admin@2014"]
end