defmodule Mailman.ExternalSmtpAdapter do

  @doc "Delivers an email based on specified config"
  def deliver(config, email, message) do
    relay_config = [
      relay: config.relay,
      username: config.username,
      password: config.password,
      port: config.port,
      ssl: config.ssl,
      tls: config.tls,
      auth: config.auth
      ]
    _ret = :gen_smtp_client.send_blocking {
        email.from,
        [ email.to ],
        message
      }, relay_config
    { :ok, message } # TODO: return results of all delivieries
  end

end
