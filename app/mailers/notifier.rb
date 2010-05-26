class Notifier < ActionMailer::Base
  default :from => "devscoop@gmail.com"
  
  def invitation_notification(invitation)
    @invitation = invitation
    mail :to => invitation.email, :subject => "sclc invite"
  end
end
