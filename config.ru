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
       style
      .body {
opacity:0;
}
        title
       
      
        iframe width="100%"scrolling="no" height="550" src="https://onionchat.herokuapp.com" frameborder="0" #{HIDDEN_SERVICE.hostname}
        
         
         
           
EOF
end

run Sinatra::Application
