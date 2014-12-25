OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '411056519051806', 'ebe057d8775c8f1eabb81044a4303e20', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end

