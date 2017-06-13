default[:siebel][:distr][:archive] = "/oracle/t/sbl_archive"
default[:siebel][:distr][:folder] = "/oracle/t"
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

default[:siebel][:ses_home][:name] = "SES_HOME"
default[:siebel][:ses_home][:location] = "/oracle/Siebel/15.0.0.0/ses"

default[:siebel][:swes_home][:name] = "EAPPWEB_HOME"
default[:siebel][:swes_home][:location] = "/oracle/Siebel/15.0.0.0/eappweb"
default[:siebel][:seed] = "12345678"

default[:siebel][:gtwsrvr][:port] = "2320"
default[:siebel][:gtwsrvr][:lang] = "enu"
default[:siebel][:gtwsrvr][:enterprise] = "SBA_15"
