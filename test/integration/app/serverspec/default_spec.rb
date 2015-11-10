require 'spec_helper'

describe file('/opt/go/bin/sainsburys') do
  it { is_expected.to exist }
  it { is_expected.to be_mode 755 }
  it { is_expected.to be_owned_by 'root' }
  it { is_expected.to be_grouped_into 'root' }
end

describe service('sainsburys') do
  it { is_expected.to be_enabled }
  it { is_expected.to be_running }
end

describe port(8484) do
  it { is_expected.to be_listening }
end
