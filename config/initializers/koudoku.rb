Koudoku.setup do |config|
  config.subscriptions_owned_by = :user
  config.stripe_publishable_key =  'pk_test_FqgdW3hG3A4QR3de6CFGnkaD'
  # ENV['STRIPE_PUBLISHABLE_KEY']
  config.stripe_secret_key = 'sk_test_iJ5Ogm9BARn5boL03mqVmpUT'
  # ENV['STRIPE_SECRET_KEY']
  
  Stripe.api_version = '2016-02-29' #Making sure the API version used is compatible.
  # config.prorate = false # Default is true, set to false to disable prorating subscriptions
  config.free_trial_length = 12

  # Specify layout you want to use for the subscription pages, default is application
  config.layout = 'application'
  
  # you can subscribe to additional webhooks here
  # we use stripe_event under the hood and you can subscribe using the 
  # stripe_event syntax on the config object: 
  # config.subscribe 'charge.failed', Koudoku::ChargeFailed
  
end
