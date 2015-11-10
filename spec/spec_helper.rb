require 'infrataster/rspec'
require 'net/http'

APP1_STRING = 'Hi there, I\'m served from app-thrashing-volcano-2002!'
APP2_STRING = 'Hi there, I\'m served from app-pensive-landscape-4090!'

Infrataster::Server.define(:web) do |server|
  server.address = '192.168.33.33'
  server.vagrant = true
end

Infrataster::Server.define(:app1) do |server|
  server.address = '192.168.33.53'
  server.vagrant = true
end

Infrataster::Server.define(:app2) do |server|
  server.address = '192.168.33.73'
  server.vagrant = true
end

def round_robin
  responses = []
  uri = URI.parse('http://192.168.33.33')
  (1..10).each do
    responses << Net::HTTP.get_response(uri).body
  end
  responses
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
