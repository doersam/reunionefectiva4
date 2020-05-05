class AddOrganizationToMeeting < ActiveRecord::Migration[6.0]
  def change
    add_reference :meetings, :organization, null: false, foreign_key: true
  end
end
