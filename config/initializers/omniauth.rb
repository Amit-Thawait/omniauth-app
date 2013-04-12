OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, '124580891058671', '9e9c6d66e3845f163fc8972a003c5537'
  provider :github, '8e16b065d4d1220980ed', 'ad5ed089a9a3730dae8a3da5f090848ca3483125'
  #provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end

