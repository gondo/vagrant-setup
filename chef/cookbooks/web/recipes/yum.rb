#via chef method
#yum_repository 'epel' do
#  url 'http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'
#  action :add
#end
#yum_repository 'remi' do
#  url 'http://rpms.famillecollet.com/enterprise/remi-release-6.rpm'
#  action :add
#end

#direct connect
#execute 'yum-epel' do
#	command 'rpm -UFvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'
#	not_if 'rpm -qa | grep epel-release-6-8.noarch'
#	#action :nothing
#end
#execute 'yum_remi' do
#	command 'rpm -UFvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm'
#	not_if 'rpm -qa | grep remi-release-6'
#	#action :nothing
#end
#execute 'yum update -y'
#rpm_package 'yum' do
#	action :upgrade
#end