# 
# Thycotic Secrets Server
#
# Fetches a secret from the secret server, using the crendials provided
# 
# @param username
#    The username for authentication
#
# @param password
#    The password for authentication 
#
# @param tenant
#    The tenant of the server you are requesting access to
#
# @param secret_id
#    The id of the required secret
#

class thycotic_tss::tss(
  String $username,
  String $password,
  String $server_url,
  String $secret_id,
){
  package { 'tss-sdk':
    ensure   => 'installed',
    provider => 'puppet_gem',
  }

  $secret = tss_secret($username, $password, $server_url, $secret_id, $thycotic_tss::metadata)
}
