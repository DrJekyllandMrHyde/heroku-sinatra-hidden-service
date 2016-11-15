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
meta name=viewport content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
 
        title #{HIDDEN_SERVICE.hostname}

        body style="
    margin: 0;
    overflow: hidden;
"
       
      
        iframe scrolling="no" src="https://onionchat.herokuapp.com" style="
    position: absolute;
    width: 100%;
    height: 100%; frameborder="0" #{HIDDEN_SERVICE.hostname}
        
         
         
           
EOF
 
end

run Sinatra::Application
