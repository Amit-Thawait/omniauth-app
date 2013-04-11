OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, '124580891058671', '9e9c6d66e3845f163fc8972a003c5537'
  #provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end

