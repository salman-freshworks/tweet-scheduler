# config/initializers/memcached.rb

require 'dalli'

MEMCACHE = Dalli::Client.new('localhost:11211', { namespace: 'scheduled_tweets', compress: true })
