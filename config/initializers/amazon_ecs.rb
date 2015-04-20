require 'amazon/ecs'

Amazon::Ecs.configure do |options|
  options[:associate_tag]     = ""
  options[:AWS_access_key_id] = ""
  options[:AWS_secret_key]    = ""
  options[:search_index]      = "Books"
  options[:response_group]    = "Medium"
  #options[:sort]              = "salesrank"   #These seem to give inappropriate results
end
