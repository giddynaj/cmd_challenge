require 'test_helper'
require 'csv'

class PatientTest < ActiveSupport::TestCase
  test "should import all rows of a good csv file" do
    csv_file = CSV.read Rails.root.join('test','fixtures','files','good.csv')
    report = File.new('./test.txt','w+')
    Patient.import(Rails.root.join('test','fixtures','files','good.csv'), report)
    assert csv_file.count == Patient.count
  end
end
