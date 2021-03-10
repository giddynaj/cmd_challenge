require 'csv'

class GetCleanCsvJob < ApplicationJob
  queue_as :default

  def perform(*args)
    CSV.open('./output.csv', 'w+') do | csv |
      csv << Patient.attribute_names
      binding.pry
      Patient.find_each do | patient |
        binding.pry
        
        csv << patient.attributes.values
      end
    end
  end
end
