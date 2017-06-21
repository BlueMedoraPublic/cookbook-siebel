# Prepare Distrib Files
node[:siebel][:distr][:files][:ent].each do |file, url|
  # Fetch zips with Distribs
  execute "fetch_ent_file_#{file}" do
    command "curl -L -o enterprise_#{file} #{url}/#{file}?dl=1"
    user "oracle"
    group "oinstall"
    cwd node[:siebel][:distr][:archive]
    not_if { ::File.exists?("#{node[:siebel][:distr][:archive]}/#{file}") }
  end

  # Unzip distribs
  execute "unzip_ent_#{file}" do
    command "unzip #{node[:siebel][:distr][:archive]}/enterprise_#{file}"
    user "oracle"
    group "oinstall"
    cwd "#{node[:siebel][:distr][:folder]}/ent"
  end

  execute "change_mode_for_installer" do
    command "sudo chmod 755 .oui runInstaller lsnodes resource unzip *.sh"
    cwd "#{node[:siebel][:distr][:folder]}/ent/Disk1/install"
  end
end
