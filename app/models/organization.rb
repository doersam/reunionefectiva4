class Organization < ApplicationRecord
  has_many :teams
  has_many :participations, through: :teams
  validates :name, presence: true
  validates :legal_id, presence: true
  validates :contact_email, presence: true
   # validates :legacy_code, format: { with: /\A[a-zA-Z]+\z/,  message: "only allows letters" }
end
