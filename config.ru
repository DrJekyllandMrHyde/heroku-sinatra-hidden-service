require 'tor/hidden-service'
HIDDEN_SERVICE = Tor::HiddenService.new(
  private_key: OpenSSL::PKey::RSA.generate(1024).to_pem,
  server_port: ENV['PORT'] || 5000
)
HIDDEN_SERVICE.start

require 'sinatra'

get "/" do "ruby sinatra app" end


get '/hello/:name' do
  # соответствует "GET /hello/foo" и "GET /hello/bar",
  # где params['name'] 'foo' или 'bar'
  "Hello #{params['name']}!"
end


run Sinatra::Application
