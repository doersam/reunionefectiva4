class UserMailer < ApplicationMailer
  default :from => 'hola@reuefectiva.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail(to: @user.email, subject: 'Thanks for signing up for our amazing app' )
  end


  def respond_with_info(user, email)
    @user = user
    @email = email

    mail(to: "dorsam.m@gmail.com", subject: 'Hola ahi va la informacion del correo' )



  end
end
