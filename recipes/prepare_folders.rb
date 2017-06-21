# Creating SIEBEL_HOME 
directory "#{node[:siebel][:oracle_home][:location]}" do
  recursive true
  owner "oracle"
  group "oinstall"
  mode "0755"
  action :create
end

# Creating Enterprise Install Folder
directory "#{node[:siebel][:distr][:folder]}/ent" do
  recursive true
  owner "oracle"
  group "oinstall"
  mode "0755"
  action :create
end

# Creating SWES Install Folder
directory "#{node[:siebel][:distr][:folder]}/swes" do
  recursive true
  owner "oracle"
  group "oinstall"
  mode "0755"
  action :create
end

# Creating Archive Folder
directory "#{node[:siebel][:distr][:archive]}" do
  recursive true
  owner "oracle"
  group "oinstall"
  mode "0755"
  action :create
end