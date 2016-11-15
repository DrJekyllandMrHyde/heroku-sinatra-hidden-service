require 'tor/hidden-service'
HIDDEN_SERVICE = Tor::HiddenService.new(
  private_key: OpenSSL::PKey::RSA.generate(1024).to_pem,
  server_port: ENV['PORT'] || 5000
)
HIDDEN_SERVICE.start

require 'sinatra'

get '/' do     #{HIDDEN_SERVICE.hostname} 
  slim <<EOF
    doctype html
    html
      head
        title ← ↑ →
      body
        iframe frameborder="0" width="100%"scrolling="no" height="550" src="https://onionchat.herokuapp.com"
        
          #{HIDDEN_SERVICE.hostname}  
         
           
EOF
end

run Sinatra::Application
