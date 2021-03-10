require 'test_helper'

class ImportFileTest < ActiveSupport::TestCase
  COLUMNS = [:last_name, :first_name, :dob,
             :member_id, :effective_date, :expiry_date,
             :phone_number]

  test "should open a csv file" do
    import_file = ImportFile.new(Rails.root.join('test','fixtures','files','good.csv'), COLUMNS)
    assert import_file.file.is_a? CSV 
  end

  test "should generate a hash of attributes" do
    import_file = ImportFile.new(Rails.root.join('test','fixtures','files','good.csv'), COLUMNS)
    assert import_file.generate_attributes_hash.is_a? Hash
  end
end
