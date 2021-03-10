require 'csv'
class ImportFile
  attr_accessor :file
  def initialize(file_path)
    raise StandardError.new "File does not exist" unless File.exists? file_path 
    @file = CSV.open(file_path)
  end
end
