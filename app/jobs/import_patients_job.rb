class ImportPatientsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    report = File.new(Rails.root.join('report.txt'), "w+")
    report.write "Import Report\n"
    Patient.import(args[0].to_s, report)
    report.close
  rescue StandardError => e
    STDERR.puts e.message
  else
    STDOUT.puts "Job Completed"
  end
end
