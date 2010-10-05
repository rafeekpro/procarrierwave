CarrierWave.configure do |config|
  if Rails.env.production?
   config.storage = :file
# 	config.storage = :s3
# 	config.s3_access_key_id = 'ACCESSKEY'
# 	config.s3_secret_access_key = 'SEKRIT'
# 	config.s3_bucket = 'i_haz_bukkit'
# 	config.s3_access = :public_read
# 	config.s3_headers = {'Cache-Control' => 'max-age=315576000',
# 	   'Expires' => 99.years.from_now.httpdate}
  elsif Rails.env.development?
	config.storage = :file
  else
	config.storage = :file
  end
end