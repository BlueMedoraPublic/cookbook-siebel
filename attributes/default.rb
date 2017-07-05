default[:siebel][:distr][:folder] = "/oracle/t"
default[:siebel][:distr][:archive] = "#{node[:siebel][:distr][:folder]}/sbl_archive"

default[:siebel][:distr][:files][:ent] = {
  "Disk1.zip" => "<some uri>"
}
default[:siebel][:distr][:files][:swes] = {
  "Disk1.zip" => "<some uri>"
}

default[:siebel][:server_modules] = {
  siebel_server: true,
  siebel_gateway: true,
  siebel_database_util: true,
  siebel_web_ext: true
}

default[:siebel][:version] = '16.0.0.0'

default[:siebel][:ses_home][:name] = "SES_HOME"
default[:siebel][:ses_home][:location] = "/oracle/Siebel/#{node[:siebel][:version]}/ses"

default[:siebel][:swes_home][:name] = "EAPPWEB_HOME"
default[:siebel][:swes_home][:location] = "/oracle/Siebel/#{node[:siebel][:version]}/eappweb"
default[:siebel][:seed] = "12345678"

default[:siebel][:gtwsrvr][:port] = "2320"
default[:siebel][:gtwsrvr][:lang] = "enu"
default[:siebel][:gtwsrvr][:enterprise] = "SBA_15"
