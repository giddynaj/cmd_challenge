require 'csv'
class ImportFile
  attr_accessor :file, :columns
  def initialize(file_path, columns)
    raise StandardError.new "File does not exist" unless File.exists? file_path 
    @file = CSV.open(file_path)
    @columns = columns
  end

  def generate_attributes_hash
    row = @file.gets
    unless row.nil?
      h = @columns.each_with_index.map { | v, i | [ v, row[i]] }
      Hash[h]
    end
  end
end
