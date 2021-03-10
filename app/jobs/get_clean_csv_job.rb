require 'csv'

class GetCleanCsvJob < ApplicationJob
  queue_as :default

  def perform(*args)
    CSV.open('./output.csv', 'wb') do |csv|
      csv << Patient.attribute_names
      Patient.all.each do |patient|
        csv << user.attributes.values
      end
    end
  end
end
