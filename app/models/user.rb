class User < ApplicationRecord
  #esta linea no deja signup
  has_many :participations
  has_many :teams, through: :participations
  # has_many :organization, through: :participations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
