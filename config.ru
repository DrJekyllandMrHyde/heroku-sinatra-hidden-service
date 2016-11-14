require 'tor/hidden-service'
HIDDEN_SERVICE = Tor::HiddenService.new(
  private_key: OpenSSL::PKey::RSA.generate(1024).to_pem,
  server_port: ENV['PORT'] || 5000
)
HIDDEN_SERVICE.start

require 'sinatra'

get '/' do
  slim <<EOF
    <iframe src="#{Api.host(subdomain)}/openid/embed?#{embed_params(url, options)}"
        scrolling="no" frameBorder="no" style="width:#{options[:width]}px;height:#{options[:height]}px;" id="rpx_now_embed">
      </iframe>
EOF
end

run Sinatra::Application
