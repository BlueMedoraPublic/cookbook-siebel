arch_folder = node[:siebel][:distr][:archive]
distr_folder = node[:siebel][:distr][:folder]

# Creating SWES Install Folder
directory "#{distr_folder}/swes" do
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
node[:siebel][:distr][:files][:swes].each do |file, url|
  # Fetch zips with Distribs
  execute "fetch_swes_file_#{file}" do
    command "curl -L -o swes_#{file} #{url}/#{file}?dl=1"
    user "oracle"
    group "oinstall"
    cwd arch_folder
    not_if { ::File.exists?("#{arch_folder}/#{file}") }
  end

  # Unzip distribs
  execute "unzip_swes_#{file}" do
    command "unzip #{arch_folder}/swes_#{file}"
    user "oracle"
    group "oinstall"
    cwd "#{distr_folder}/swes"
  end

  execute "change_mode_for_installer" do
    command "sudo chmod 755 .oui runInstaller lsnodes unzip *.sh"
    cwd "#{distr_folder}/swes/Disk1/install"
  end
end
