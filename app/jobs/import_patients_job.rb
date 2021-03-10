class ImportPatientsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    raise StandardError.new "File does not exist" unless File.exists? args[0].to_s
  rescue StandardError => e
    STDERR.puts e.message
  end
end
