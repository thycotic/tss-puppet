require 'tss'

Puppet::Functions.create_function(:tss_secret) do
  def tss_secret(username, password, server_url, secret_id, metadata)
    config = {
      username: username,
      password: password,
      server_url: server_url,
    }

    server = Tss::Server.new(config)

    begin
      secret = Tss::Secret.fetch(server, secret_id)

      puts secret
      unless metadata
        secret = secret['items'].to_s
      end
      puts secret
    rescue InvalidSecretException
      puts 'TSS: Unable to access secret'
      return nil
    end

    secret
  end
end
