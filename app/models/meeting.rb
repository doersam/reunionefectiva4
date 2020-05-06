class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :team, optional: true
  belongs_to :organization
end
