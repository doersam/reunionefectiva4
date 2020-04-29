class Team < ApplicationRecord
  belongs_to :organization
  has_many :users

  validates :name, presence: :true
  validates_associated :organization

end
