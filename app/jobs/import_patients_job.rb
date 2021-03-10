class ImportPatientsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    import_file = ImportFile.new(args[0].to_s)
    report = File.new(Rails.root.join('report.txt'), "w+")
      report.write "This is a report"
    report.close
  rescue StandardError => e
    STDERR.puts e.message
  else
    STDOUT.puts "Job Completed"
  end
end
