# CarrierWave.configure do |config|
#   config.fog_credentials = {
#     :provider               => 'AWS',                  
#     :aws_access_key_id      => ENV["S3_KEY"],  
#     :aws_secret_access_key  => ENV["S3_SECRET"] 
#   }
#   config.fog_directory  = ENV["S3_BUCKET"] 
# end


CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                  
    :aws_access_key_id      => 'AKIAIITIHFLDQSVV53KQ', 
    :aws_secret_access_key  => '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'
  }
  config.fog_directory  = 'testprepare-bucket'
end


# CarrierWave.configure do |config|
#   config.fog_provider = 'fog/aws'                        # required
#   config.fog_credentials = {
#     provider:              'AWS',                        # required
#     aws_access_key_id:     'AKIAIITIHFLDQSVV53KQ',         # required
#     aws_secret_access_key: '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'  # required
#   }
#   config.fog_directory  = 'testprepare-bucket'     # required
# end

