include_recipe 'golang'

directory node['sainsburys']['src_dir'] do
  recursive true
  owner node['go']['owner']
  group node['go']['group']
  mode node['go']['mode']
end

cookbook_file node['sainsburys']['src_file'] do
  source 'sainsburys.go'
  owner node['go']['owner']
  group node['go']['group']
  mode node['go']['mode']
  notifies :run, 'bash[go install sainsburys]', :immediately
end

bash 'go install sainsburys' do
  code "#{node['go']['install_dir']}/go/bin/go install \
   #{node['sainsburys']['src_file']}"
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
  action [:enable, :start]
end
