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


  def join_team_email(sender,team, user, member)
    @team = team.name 
    @sender = sender.name 
    @token = member.token 
    mail( :to             => user.email, 
          :subject        => "Confirm team contributingcode",
          :template_path  => 'mailer',
          :template_name  => 'join_team')
  end

end