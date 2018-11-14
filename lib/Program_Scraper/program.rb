class ProgramScraper::Program
  
  def self.all
    # return a bunch of instances of Program
    puts <<-DOC.gsub /^\s*/,''
    
    1. Business Management
    2. Business Transfer
    3. Corrections
    4. Health Information Management Technician
    5. Law Enforcement
    6. Supervisory Skills
    7. Supply Chain Management
    DOC
  end
  
end