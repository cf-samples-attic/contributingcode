class Notifier < ActionMailer::Base
  
  default :from => "contributingcode contributingcode@vmware.com"
  
  # confirmation
  # @date 05/23/2012
  # @author Magil
  #
  # <b>Expects</b>
  # * <em>email</em> user email
  def register_email(name, email)
    @name = name
    mail( :to             => email, 
          :subject        => "Thank you for registering for contributingcode",
          :template_path  => 'mailer',
          :template_name  => 'register' )
  end

end