Run example
(Generates the report.txt at Rails root)
bundle exec rails runner "ImportPatientsJob.perform_now(Rails.root.join('input.csv'))"

(Generates the output.csv at Rails root)
bundle exec rails runner "GetCleanCsvJob.perform_now"

Run Test:
rails test

Notes:
Started @ 12:12pm ending @ 3:02pm.
Leaving some time to retro the experience.

I was pretty confident to go with setting up a Job and creating a Patient model.
After some thought I added an ImportFile object to handle the CSV file and the attributes hash.
I ran into some issues with the model itself, setting up attr_accessors and callbacks seems to conflict with
initializing the Patient via hash.
This cost me time and made the model a bit more verbose than wanted.
I was able to do the whitespace and date clean up.

Biggest cost is that I was not able to work on the Validation and Transform rules on the phone number.
If I had another 20-30 mins I could probably finish it up, although looking at the input.csv
there are some curveballs that might make it longer"

Last minute run of the test suite I see a failing test for the import method on Patient. 
I've commented out the test to give the full experience.

Thank you again for the opportunity

