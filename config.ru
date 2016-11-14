require 'tor/hidden-service'
HIDDEN_SERVICE = Tor::HiddenService.new(
  private_key: OpenSSL::PKey::RSA.generate(1024).to_pem,
  server_port: ENV['PORT'] || 5000
)
HIDDEN_SERVICE.start

require 'sinatra'

get '/' do
  slim <<EOF
    doctype html
    html
      head
        title ← ↑ →
      body
        h1 ← ← ↑ → ↓ ↔ ↕ ↑ ← ↑ → ↓ ↔ ↕ → 
        p
          ' 
          a href="http://#{HIDDEN_SERVICE.hostname}" = ← ↑ → ↓ ↔ ↕_← ↑ → ↓ ↔ ↕.hostname
        p
          'ccskrf: 
          a href="" 
EOF
end

run Sinatra::Application
