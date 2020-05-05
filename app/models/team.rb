class Team < ApplicationRecord
  belongs_to :organization
  has_many :participations
  has_many :users, through: :participations
  has_many :meetings

  validates :name, presence: :true
  validates_associated :organization

end
