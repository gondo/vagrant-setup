execute 'yum -y --enablerepo=remi,remi-test install mysql mysql-server'

service 'mysqld' do
	action [:enable, :start]
end

