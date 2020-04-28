class Organization < ApplicationRecord
  validates :name, presence: true
  validates :legal_id, presence: true
  validates :contact_email, presence: true

end
