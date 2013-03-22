ASIN::Configuration.configure do |config|
  config.secret        = ENV["S3secret"]
  config.key           = ENV["S3key"]
  config.associate_tag = 'wwwbluenosegi-21'
  config.logger        = nil
end