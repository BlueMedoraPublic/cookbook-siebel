ent_install_folder = "#{node[:siebel][:distr][:folder]}/ent/Disk1"

unless File.exists?(node[:siebel][:ses_home][:location])
  unless File.exists?(ent_install_folder) 
    include_recipe 'siebel::prepare_distrib_for_ent' 
  end

  # Creating SIEBEL_HOME 
  directory "#{node[:siebel][:ses_home][:location]}" do
    recursive true
    owner "oracle"
    group "oinstall"
    mode "0755"
    action :create
  end

  # Prepare response file
  template "/home/oracle/ses.rsp" do
    source "ses.rsp.erb"
    user "oracle"
    group "oinstall"
    mode "0755"
  end

  # Run Installer
  bash 'run_ent_installer' do
    user "oracle"
    group "oinstall"
    cwd "#{ent_install_folder}/install"
    code "./runInstaller -silent -waitforcompletion -responseFile /home/oracle/ses.rsp"
  end
end
