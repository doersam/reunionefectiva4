class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :team
   # has_many :organizations, through: :teams
end
