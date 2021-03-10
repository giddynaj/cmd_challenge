class Patient < ApplicationRecord
  COLUMNS = [:last_name, :first_name, :dob,
             :member_id, :effective_date, :expiry_date,
             :phone_number]

  def self.import(file_path, report)
    import_file = ImportFile.new(file_path, COLUMNS)
    while !(row = import_file.generate_attributes_hash).nil?
      Patient.create(row)
    end
  end
end
