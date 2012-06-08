# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Tumblrtv::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name            => "mvmware.com814",
  :password             => "sharedpass",
  :domain               => "cloudfoundry.org",
  :address              => "smtp.sendgrid.net",
  :port                 => 587,
  :authentication       => :plain,
  :enable_starttls_auto => false
}

