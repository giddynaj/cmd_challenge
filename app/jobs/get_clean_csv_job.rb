require 'csv'

class GetCleanCsvJob < ApplicationJob
  queue_as :default

  def perform(*args)
    CSV.open('./output.csv', 'w+') do | csv |
      csv << Patient.attribute_names
      Patient.find_each do | patient |
        csv << patient.attributes.values
      end
    end
  end
end
