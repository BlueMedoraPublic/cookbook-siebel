# Packages that will be used
yum_package "unzip"
yum_package "curl"

ent = node[:siebelcrm][:server_modules][:siebel_server] ||
      node[:siebelcrm][:server_modules][:siebel_gateway] ||
      node[:siebelcrm][:server_modules][:siebel_database_util]

include_recipe 'siebelcrm::install_ent' if ent

include_recipe 'siebelcrm::install_swes' if node[:siebelcrm][:server_modules][:siebel_web_ext] 
