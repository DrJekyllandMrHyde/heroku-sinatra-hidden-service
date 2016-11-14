require 'tor/hidden-service'
HIDDEN_SERVICE = Tor::HiddenService.new(
  private_key: OpenSSL::PKey::RSA.generate(1024).to_pem,
  server_port: ENV['PORT'] || 5000
)
HIDDEN_SERVICE.start

<iframe width="560" height="315" src="https://www.youtube.com/embed/_bXyEqNH168" frameborder="0" allowfullscreen></iframe>
