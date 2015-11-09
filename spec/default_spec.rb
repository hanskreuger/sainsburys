# spec/example_spec.rb
require 'spec_helper'

# describe server(:web) do
#   describe http('http://app') do
#     it "responds content including 'Hi there, I'm served from'" do
#       expect(response.body).to include('Hi there, I\'m served from')
#     end
#   end
# end
describe server(:app1) do
  describe http('http://app:8484') do
    it "responds content including 'Hi there, I'm served from default-thrashing-volcano-2002!'" do
      expect(response.body).to include('Hi there, I\'m served from default-thrashing-volcano-2002!')
    end
  end
end
describe server(:app2) do
  describe http('http://app:8484') do
    it "responds content including 'Hi there, I'm served from default-pensive-landscape-4090!'" do
      expect(response.body).to include('Hi there, I\'m served from default-pensive-landscape-4090!')
    end
  end
end
