# Prepare response file
template "/home/oracle/gtwsrvr.rsp" do
  source "gtwsrvr.rsp.erb"
  user "oracle"
  group "oinstall"
  mode "0755"
end

# Run Configurator
bash 'create_gateway_server' do
  user "oracle"
  group "oinstall"
  cwd "#{node[:siebel][:ses_home][:location]}/config"
  code <<-EOH
    chmod 770 #{node[:siebel][:ses_home][:location]}/gtwsrvr/cfgenv.sh
    source #{node[:siebel][:ses_home][:location]}/gtwsrvr/cfgenv.sh
    
    export LD_LIBRARY_PATH=/oracle/Siebel/15.0.0.0/ses/siebsrvr/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=/oracle/Siebel/15.0.0.0/ses/gtwsrvr/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=/oracle/app/oracle/product/11.2.0/client/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH

    ./config.sh -mode enterprise -responseFile /home/oracle/gtwsrvr.rsp -verbose -skipValidation
  EOH
end
