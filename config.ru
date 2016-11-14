require 'tor/hidden-service'
HIDDEN_SERVICE = Tor::HiddenService.new(
  private_key: OpenSSL::PKey::RSA.generate(1024).to_pem,
  server_port: ENV['PORT'] || 5000
)
HIDDEN_SERVICE.start

require 'sinatra'

get "/" do "ruby sinatra app"  "HIDDEN_SERVICE.hostname #{HIDDEN_SERVICE.hostname['HIDDEN_SERVICE.hostname']}!" end


get '/HIDDEN_SERVICE.hostname/:name' do
  # соответствует "GET /hello/foo" и "GET /hello/bar",
  # где params['name'] 'foo' или 'bar'
  "name #{HIDDEN_SERVICE.hostname['HIDDEN_SERVICE.hostname']}!"
end


get '/HIDDEN_SERVICE.hostname/:name' do |n|
  "HIDDEN_SERVICE.hostname #{n}!"
end


run Sinatra::Application
