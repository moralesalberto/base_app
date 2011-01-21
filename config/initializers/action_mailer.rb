ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "smtp.opnet.com", 
  :port => 25, 
  :domain => "opnet.com",
  :authentication       => 'plain',
  :enable_starttls_auto => true

}

