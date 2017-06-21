# Prepare Distrib Files
node[:siebel][:distr][:files][:swes].each do |file, url|
  # Fetch zips with Distribs
  execute "fetch_swes_file_#{file}" do
    command "curl -L -o swes_#{file} #{url}/#{file}?dl=1"
    user "oracle"
    group "oinstall"
    cwd node[:siebel][:distr][:archive]
    not_if { ::File.exists?("#{node[:siebel][:distr][:archive]}/#{file}") }
  end

  # Unzip distribs
  execute "unzip_swes_#{file}" do
    command "unzip #{node[:siebel][:distr][:archive]}/swes_#{file}"
    user "oracle"
    group "oinstall"
    cwd "#{node[:siebel][:distr][:folder]}/swes"
  end

  execute "change_mode_for_installer" do
    command "sudo chmod 755 .oui runInstaller lsnodes unzip *.sh"
    cwd "#{node[:siebel][:distr][:folder]}/swes/Disk1/install"
  end
end
