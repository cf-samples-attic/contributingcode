# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Tumblrtv::Application.initialize!


# ActionMailer::Base.smtp_settings = {
#   :user_name            => "appcloud",
#   :password             => "@ppcl0ud",
#   :domain               => "cloudfoundry.org",
#   :address              => "smtp.las01.emcatmos.com",
#   :port                 => 587,
#   :authentication       => :plain,
#   :enable_starttls_auto => false
# }

ActionMailer::Base.smtp_settings = {
  :user_name            => "cours.ly",
  :password             => "mystartup",
  :domain               => "cours.ly",
  :address              => "smtp.sendgrid.net",
  :port                 => 587,
  :authentication       => :plain,
  :enable_starttls_auto => true
}
