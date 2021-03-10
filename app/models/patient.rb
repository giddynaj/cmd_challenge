class Patient < ApplicationRecord
  COLUMNS = [:last_name, :first_name, :dob,
             :member_id, :effective_date, :expiry_date,
             :phone_number]

  before_validation :clean_all_whitespace
  before_validation :clean_dob, :clean_effective_date, :clean_expiry_date

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :dob, presence: true
  validates :member_id, presence: true
  validates :effective_date, presence: true

  def clean_all_whitespace
    self.last_name = self.last_name.strip
    self.first_name = self.first_name.strip
    self.dob = self.dob.strip
    self.member_id = self.member_id.strip
    self.effective_date = self.effective_date.strip
    self.expiry_date = self.expiry_date.strip
    self.phone_number = self.phone_number.strip
  end

  def clean_whitespace(field)
    self.send(field).strip
  end

  def clean_dob
    self.dob = clean_date(self.dob)
  end

  def clean_effective_date
    self.effective_date = clean_date(self.effective_date)
  end

  def clean_expiry_date
    self.expiry_date = clean_date(self.expiry_date)
  end

  def clean_whitespace(field)
    field = field.strip
  end
    
  def clean_date(field)
    converted = Date::strptime(field, "%m/%d/%Y")
    "#{converted.year}-#{converted.month}-#{converted.mday}"
  rescue
    field
  end

  def self.import(file_path, report)
    import_file = ImportFile.new(file_path, COLUMNS)
    report.write "Bad Imports\n"
    report.write "----------------------------------------\n"
    while !(row = import_file.generate_attributes_hash).nil?
      p = Patient.new(row)
      unless p.valid?
       report.write row + "\n" 
       report.write p.errors.to_s + "\n"
      else
       p.save
      end
    end
  end
end
