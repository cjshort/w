CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => "AKIAICBZVHJS3VLXGYBQ",
      :aws_secret_access_key  => "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",
      :region                 => "us-west-2"
  }
  config.fog_directory  = 'wifi-uploads'
end