class MeetingMailer < ApplicationMailer
  default :from => 'hola@reuefectiva.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.meeting_mailer.confirm.subject
  #
  def send_test_email
    mail(to: "dorsam.m@gmail.com", subject: 'Thanks for signing up for our amazing app' )
  end



end
