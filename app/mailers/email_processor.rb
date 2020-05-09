class EmailProcessor
  skip_before_action :authenticate_user!, only: [:initialize, :process]
  def initialize(email)
    @email = email
  end

  def process
    # all of your application-specific code here - creating models,
    # processing reports, etc

    # Here's an example of model creation
    UserMailer.send_signup_email(User.first).deliver

  end
end
