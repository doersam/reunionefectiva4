class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :team, optional: true
  belongs_to :organization
  has_many :invitations, dependent: :destroy
end
