execute 'yum -y --enablerepo=remi,remi-test install php-fpm php-common'
execute 'yum -y --enablerepo=remi,remi-test install php-cli php-gd php-mbstring php-mcrypt php-xml php-pdo php-mysql php-pecl-apc php-pecl-memcache php-pecl-memcached'

service 'php-fpm' do
	action [:enable, :start]
end