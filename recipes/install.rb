# Packages that will be used
yum_package "unzip"
yum_package "curl"

ent = node[:siebel][:server_modules][:siebel_server] ||
      node[:siebel][:server_modules][:siebel_gateway] ||
      node[:siebel][:server_modules][:siebel_database_util]

include_recipe 'siebel::install_ent' if ent

include_recipe 'siebel::install_swes' if node[:siebel][:server_modules][:siebel_web_ext] 
