# Creating SIEBEL_HOME 
directory "#{node[:siebel][:oracle_home][:location]}" do
  recursive true
  owner "oracle"
  group "oinstall"
  mode "0755"
  action :create
end
