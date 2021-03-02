# 
# Integrates with Thycotic Secret Server
#
# Fetches a secret from the secret server, using the crendials provided
#
# @param metadata
#    Boolean value to determine if we want to return the metadata for a secret
#
# @param storage_name
#   Specifies the filename where the file will be installed (inside /tmp)
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

class tss(
  String $username,
  String $password,
  String $server_url,
  String $secret_id,
  Boolean $metadata = false,
){
  package { 'tss-sdk':
    ensure   => 'installed',
    provider => 'puppet_gem',
  }

  $secret = tss_secret($username, $password, $server_url, $secret_id, $metadata)
}
