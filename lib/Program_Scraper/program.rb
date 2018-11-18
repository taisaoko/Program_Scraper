class ProgramScraper::Program
attr_accessor :name, :credit, :career, :url
  
  def self.all
    # Scrape Sinclair website and return programs based on that data
    # ProgramScraper::Scraper.new("http://sinclair.edu/academics/online/")
    self.scrape_programs
  end
  
  def self.scrape_programs
    programs = []
    programs << self.scrape_sinclair
    # Go to Sinclair
    # Find the program
    # instantiate a program
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
    
    programs
  end
  
  def self.scrape_sinclair
    doc = Nokogiri::HTML(open("http://sinclair.edu/academics/online/"))
    program_list = []
    
    doc.css(".col-xl-8.col-12 ul li a").children.each do |children|
      program_list << children.text
    end
    program_list
    
    
  end
  
  
end