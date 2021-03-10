require 'test_helper'

class ImportPatientsJobTest < ActiveJob::TestCase
  test "should fail if no file provided" do 
    assert_not ImportPatientsJob.perform_now
  end
end
