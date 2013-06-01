#http://wiki.nginx.org/Install
cookbook_file '/etc/yum.repos.d/nginx.repo' do
	source 'nginx.repo'
	mode 0644
	backup false
	action :create_if_missing
end

yum_package 'nginx' do
	action :install
	flush_cache [:before]
end

template '/etc/nginx/nginx.conf' do
	source 'nginx.conf.erb'
	owner 'root'
	group 'root'
	mode 0644
	notifies :reload, 'service[nginx]'
end

#execute 'mkdir -p /etc/nginx/sites-enabled/'
directory '/etc/nginx/sites-enabled' do
	action :create
	owner "root"
	group "root"
	mode 0644
end

directory '/var/www/default/logs/' do
	action :create	
	mode 0644
end

directory '/var/www/default/public_html/' do
	action :create	
	mode 777
end

template '/etc/nginx/sites-enabled/default' do
	source 'sites-enabled/default.erb'
	owner "root"
	group "root"
	mode 0644
end

service 'nginx' do
	action [:enable, :start]
end

#enable in iptables
#/etc/sysconfig/iptables
#-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
#action :restart