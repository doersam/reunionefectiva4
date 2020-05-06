class UserMailer < ApplicationMailer
  default :from => 'any_from_address@example.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)

    @user = user

    mail(to: @user.email, subject: "Bienvenido a reunion efectiva")

  end


  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end


end
