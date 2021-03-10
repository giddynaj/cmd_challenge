Run example
(Generates the report.txt at Rails root)
bundle exec rails runner "ImportPatientsJob.perform_now(Rails.root.join('input.csv'))"

(Generates the output.csv at Rails root)
bundle exec rails runner "GetCleanCsvJob.perform_now"

Run Test:
rails test
