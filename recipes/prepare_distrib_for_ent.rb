arch_folder = node[:siebelcrm][:distr][:archive]
distr_folder = node[:siebelcrm][:distr][:folder]

# Creating Enterprise Install Folder
directory "#{distr_folder}/ent" do
  recursive true
  owner "oracle"
  group "oinstall"
  mode "0755"
  action :create
end

# Creating Archive Folder
directory "#{arch_folder}" do
  recursive true
  owner "oracle"
  group "oinstall"
  mode "0755"
  action :create
end

# Prepare Distrib Files
node[:siebelcrm][:distr][:files][:ent].each do |file, url|
  # Fetch zips with Distribs
  execute "fetch_ent_file_#{file}" do
    command "curl -L -o enterprise_#{file} #{url}/#{file}?dl=1"
    user "oracle"
    group "oinstall"
    cwd arch_folder
    not_if { ::File.exists?("#{arch_folder}/#{file}") }
  end

  # Unzip distribs
  execute "unzip_ent_#{file}" do
    command "unzip #{arch_folder}/enterprise_#{file}"
    user "oracle"
    group "oinstall"
    cwd "#{distr_folder}/ent"
  end

  execute "change_mode_for_installer" do
    command "sudo chmod 755 .oui runInstaller lsnodes resource unzip *.sh"
    cwd "#{distr_folder}/ent/Disk1/install"
  end
end
