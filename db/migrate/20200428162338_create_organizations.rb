class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :legal_id
      t.string :contact_email

      t.timestamps
    end
  end
end
