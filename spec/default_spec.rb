# spec/example_spec.rb
require 'spec_helper'

describe server(:app1) do
  describe http('http://app:8484') do
    it "responds content including #{APP1_STRING}" do
      expect(response.body).to include(APP1_STRING)
    end
  end
end

describe server(:app2) do
  describe http('http://app:8484') do
    it "responds content including #{APP2_STRING}" do
      expect(response.body).to include(APP2_STRING)
    end
  end
end

describe server(:web) do
  describe http('http://app') do
    it "responds content including 'Hi there, I'm served from'" do
      expect(response.body).to include('Hi there, I\'m served from')
    end
  end
  describe 'round_robin responses should be balanced' do
    it "responds 5 times with #{APP1_STRING}" do
      expect(round_robin).to satisfy { |r| r.count(APP1_STRING) == 5 }
    end
    it "responds 5 times with #{APP2_STRING}" do
      expect(round_robin).to satisfy { |r| r.count(APP2_STRING) == 5 }
    end
  end
end
