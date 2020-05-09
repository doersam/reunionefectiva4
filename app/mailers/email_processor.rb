class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    # all of your application-specific code here - creating models,
    # processing reports, etc

    # Here's an example of model creation

    @user = User.find_by(email: @email.from[:email])

    UserMailer.respond_with_info(@user, @email).deliver

  end
end
