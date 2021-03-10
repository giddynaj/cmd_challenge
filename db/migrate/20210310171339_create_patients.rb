class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :last_name
      t.string :first_name
      t.datetime :dob
      t.string :member_id
      t.datetime :effective_date
      t.datetime :expiry_date
      t.string :phone_number

      t.timestamps
    end
  end
end
