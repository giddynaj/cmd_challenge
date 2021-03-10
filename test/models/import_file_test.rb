require 'test_helper'

class ImportFileTest < ActiveSupport::TestCase
  test "should open a csv file" do
    import_file = ImportFile.new(Rails.root.join('test','fixtures','files','good.csv'))
    assert import_file.file.is_a? CSV 
  end
end
