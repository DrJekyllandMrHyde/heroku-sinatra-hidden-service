require 'tor/hidden-service'
HIDDEN_SERVICE = Tor::HiddenService.new(
  private_key: OpenSSL::PKey::RSA.generate(1024).to_pem,
  server_port: ENV['PORT'] || 5000
)
HIDDEN_SERVICE.start

require 'sinatra'

get "/" do "ruby sinatra app"       <<EOF
    doctype html
    html
      head
        title ← ↑ →
      body
       
        p
          ' 
          a href="http://#{HIDDEN_SERVICE.hostname}" = HIDDEN_SERVICE.hostname
        p
          ' 
           
EOF    end



run Sinatra::Application
