# Preview all emails at http://localhost:3000/rails/mailers/meeting_mailer
class MeetingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/meeting_mailer/confirm
  def confirm
    MeetingMailer.confirm
  end

end
