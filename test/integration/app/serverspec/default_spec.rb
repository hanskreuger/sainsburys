require 'spec_helper'



describe file('/opt/go/bin/sainsburys') do
  it { is_expected.to exist }
end

describe service('sainsburys') do
  it { is_expected.to be_enabled }
  it { is_expected.to be_running }
end

describe port(8484) do
  it { is_expected.to be_listening }
end
