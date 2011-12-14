CarrierWave.configure do |config|
  config.storage = :s3
  config.fog_credentials = {
    :provider               => "AWS",
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],
    :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"] }
  config.fog_directory = (Rails.env == "production") ? "jshq-production" : "jshq-development"
end
