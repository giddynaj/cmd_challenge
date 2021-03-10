require 'test_helper'

class ImportPatientsJobTest < ActiveJob::TestCase
  test "should fail if no file provided" do 
    assert_not ImportPatientsJob.perform_now
  end

  test "should write a report if file is provided" do
    ImportPatientsJob.perform_now Rails.root.join('test','fixtures','files','good.csv')
    assert File.exists? Rails.root.join('report.txt')
  end
end
