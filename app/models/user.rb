class User < ApplicationRecord
  after_create :send_welcome_email


  has_many :participations
  has_many :teams, through: :participations
  # has_many :organization, through: :participations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private
  def send_welcome_email
    UserMailer.send_signup_email(self).deliver_now
  end
end
