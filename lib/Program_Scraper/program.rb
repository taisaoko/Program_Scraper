class ProgramScraper::Program
attr_accessor :name, :credit, :career, :url
  
  def self.all
    # return a bunch of instances of Program
    # puts <<-DOC.gsub /^\s*/,''
    
    # 1. Business Management - 30 credit hours
    # 2. Business Transfer - 30 credit hours
    # 3. Corrections
    # 4. Health Information Management Technician
    # 5. Law Enforcement
    # 6. Supervisory Skills
    # 7. Supply Chain Management
    # DOC
    
    program_1 = self.new
    program_1.name = "Business Management"
    program_1.credit = "30 Credit Hours"
    program_1.career = "Students completing this certificate can expect to be prepared to work as supervisors or entry-level managers in retail, manufacturing or medium and small businesses."
    program_1.url = "http://sinclair.edu/program/params/programCode/BM-S-CRT/"
    
    program_2 = self.new
    program_2.name = "Business Transfer"
    program_2.credit = "30 Credit Hours"
    program_2.career = "Employers more often than in the past require four-year business degrees or evidence that students are in the process of earning these credentials. This certificate serves as a credentialing tool for students to use in their career search, as well as, for currently employed students to show further evidence of growth and academic progress toward a bachelor's degree in business."
    program_2.url = "http://sinclair.edu/program/params/programCode/BUS-S-CRT/"
    
    [program_1, program_2]
  end
  
  
end