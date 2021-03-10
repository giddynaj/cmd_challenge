require 'test_helper'

class GetCleanCsvJobTest < ActiveJob::TestCase
  test "should write an output file" do
    ImportPatientsJob.perform_now Rails.root.join('test','fixtures','files','good.csv')
    GetCleanCsvJob.perform_now
    assert File.exists? Rails.root.join('output.csv')
  end
end
