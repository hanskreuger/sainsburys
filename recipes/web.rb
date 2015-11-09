node.default['nginx']['default_site_enabled'] = false

include_recipe 'nginx'

template '/etc/nginx/sites-available/sainsburys' do
  source 'nginx.site.erb'
  owner 'root'
  group 'root'
  mode  00755
  notifies :restart, 'service[nginx]', :delayed
end

nginx_site 'sainsburys', 'enable'
