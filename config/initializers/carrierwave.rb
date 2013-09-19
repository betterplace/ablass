CarrierWave.configure do |config|
  config.storage = :file
  #config.asset_host = ActionController::Base.asset_host
  config.enable_processing = !Rails.env.test?
end
