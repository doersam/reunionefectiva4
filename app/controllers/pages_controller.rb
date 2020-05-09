class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :email_parse]

  def home
  end

  def welcome
  end

  def email_parse
    MeetingMailer.send_test_email.deliver
  end

end
