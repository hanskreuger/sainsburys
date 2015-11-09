include_recipe 'golang'

directory '/root/go/src/sainsburys' do
  recursive true
  owner node['go']['owner']
  group node['go']['group']
  mode node['go']['mode']
end

cookbook_file '/root/go/src/sainsburys/sainsburys.go' do
  source 'sainsburys.go'
  owner node['go']['owner']
  group node['go']['group']
  mode node['go']['mode']
  notifies :run, 'bash[go install sainsburys]', :immediately
end

bash 'go install sainsburys' do
  code "#{node['go']['install_dir']}/go/bin/go install /root/go/src/sainsburys/sainsburys.go"
  user node['go']['owner']
  group node['go']['group']
  environment('GOPATH' => node['go']['gopath'],
              'GOBIN' => node['go']['gobin'])
  action :nothing
  notifies :restart, 'service[sainsburys]', :delayed
end

cookbook_file '/etc/init.d/sainsburys' do
  source 'init.sh'
  owner 'root'
  group 'root'
  mode 00755
  notifies :restart, 'service[sainsburys]', :delayed
end

service 'sainsburys' do
  action :start
end
