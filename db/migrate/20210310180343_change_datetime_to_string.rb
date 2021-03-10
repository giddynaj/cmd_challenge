class ChangeDatetimeToString < ActiveRecord::Migration[6.0]
  def change
    change_column :patients, :dob, :string
    change_column :patients, :effective_date, :string
    change_column :patients, :expiry_date, :string
  end
end
