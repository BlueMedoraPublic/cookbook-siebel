swes_install_folder = "#{node[:siebel][:distr][:folder]}/swes/Disk1"

unless File.exists?(node[:siebel][:ses_home][:location])
  unless File.exists?(swes_install_folder) 
    include_recipe 'siebel::prepare_distrib_for_swes' 
  end

  # Creating SIEBEL_HOME 
  directory "#{node[:siebel][:swes_home][:location]}" do
    recursive true
    owner "oracle"
    group "oinstall"
    mode "0755"
    action :create
  end

  # Prepare response file
  template "/home/oracle/swes.rsp" do
    source "swes.rsp.erb"
    user "oracle"
    group "oinstall"
    mode "0755"
  end

  # Run Installer
  bash 'run_swes_installer' do
    user "oracle"
    group "oinstall"
    cwd "#{swes_install_folder}/install"
    code "./runInstaller -silent -waitforcompletion -responseFile /home/oracle/swes.rsp"
  end
end
