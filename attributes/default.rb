default[:siebelcrm][:distr][:archive] = "/oracle/t/sbl_archive"
default[:siebelcrm][:distr][:folder] = "/oracle/t"
default[:siebelcrm][:distr][:files][:ent] = {
  "Disk1.zip" => "https://www.dropbox.com/s/mq6ysk9f8hhmns3"
}
default[:siebelcrm][:distr][:files][:swes] = {
  "Disk1.zip" => "https://www.dropbox.com/s/tjomd7d7q39h4oa"
}


default[:siebelcrm][:server_modules] = {
  siebel_server: true,
  siebel_gateway: true,
  siebel_database_util: true,
  siebel_web_ext: true
}

default[:siebelcrm][:ses_home][:name] = "SES_HOME"
default[:siebelcrm][:ses_home][:location] = "/oracle/Siebel/15.0.0.0/ses"

default[:siebelcrm][:swes_home][:name] = "EAPPWEB_HOME"
default[:siebelcrm][:swes_home][:location] = "/oracle/Siebel/15.0.0.0/eappweb"
default[:siebelcrm][:seed] = "12345678"

default[:siebelcrm][:gtwsrvr][:port] = "2320"
default[:siebelcrm][:gtwsrvr][:lang] = "enu"
default[:siebelcrm][:gtwsrvr][:enterprise] = "SBA_15"
