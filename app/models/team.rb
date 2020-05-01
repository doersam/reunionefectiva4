class Team < ApplicationRecord
  belongs_to :organization
  has_many :participations
  has_many :users, through: :participations

  validates :name, presence: :true
  validates_associated :organization

end
