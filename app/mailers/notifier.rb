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


  #reused method for join a team/ Add member
  # type = 1 => join
  # type = 0 => added by owner
  def join_team_email(sender,team, user, type)
    @type = 1
    @team = team.name 
    @sender = sender.name  

    mail( :to             => user.email, 
          :subject        => "Confirm team contributingcode",
          :template_path  => 'mailer',
          :template_name  => 'join_team')
  end

end