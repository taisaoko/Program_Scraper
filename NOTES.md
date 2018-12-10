Define my execution point (./bin/run)
Stub out a quick environment (anything that needs env can just load it through require './lib/Program_Scraper')
My bin file(./bin/run) creates a new incident of my controller CLI by calling the #call (which #list_programs, #detail, #goodbye)

- A CLI for Online One-Year Certificate Programs

User types program-scraper

Show a list of programs:
#self.all

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

Which programs do you want to know more about?

- What is a program?
A program has a name
A program has a URL
A program has a type of degree
A program has a contact
A program has an outcome

First #scrape_program in ProgramScraper::Program
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

Second #scrape_program in ProgramScraper::Scraper
def self.scrape_program(url)
    # Scrape Sinclair's individual program website and return more info (url)
    html = open(url)
    doc = Nokogiri::HTML(html)
    program_page = {}
   
    program_page[:name] = doc.css(".row h1").text  
    program_page[:degree_type] = doc.css(".row h5")[1].text
    program_page[:contact] = doc.css(".panel-body").text.split.join(" ")
    program_page[:division] = doc.css("a")[30].text #doc.css("a")[30].attributes.values[0].text
    program_page[:department] = doc.css("a")[31].text #doc.css("a")[30].attributes.values[0].text
    program_page[:about] = doc.css(".col-md-9.col-sm-8.col-12.content").children[10].text.split.join(" ")
    program_page[:outcomes] = doc.css("section.col-md-9.col-sm-8.col-12.content ul li").text
    if program_page[:contact] == ""
      program_page[:career_opportunity] = doc.css("p")[1].text
    else 
      program_page[:career_opportunity] = doc.css("p")[3].text
    end  
    if program.contact == ""
      program.description ||= doc.css(".col-md-9.col-sm-8.col-12.content").children[10].text.split.join(" ")
    else 
      description ||= doc.css(".col-md-9.col-sm-8.col-12.content").children[12].text.split.join(" ")
    end
  
    binding.pry
    program_page
end

Old complete ProgramScraper::Program version:
def self.new_from_index_page(r)
    self.new(r.text,
      "https://www.sinclair.edu#{r.css("a").attribute("href").text}")
  end
  
  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @@all << self
  end
  
  def self.all
    @@all 
  end
  
  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
  
  def self.find(id)
    self.all[id-1]
  end
  
  def degree_type
    @degree_type ||= doc.css(".row h5")[1].text
  end

Old complete ProgramScraper::Scraper version:
class ProgramScraper::Scraper
  def self.scrape_index_page
    # Scrape Sinclair website and return programs based on that data ("http://sinclair.edu/academics/online/")
    doc = Nokogiri::HTML(open("http://sinclair.edu/academics/online/"))
    doc.css(".col-xl-8.col-12 ul li")
  end
  
  def program_details
    self.class.scrape_index_page[0...-1].each do |r|
      ProgramScraper::Program.new_from_index_page(r)
    end
  end
end
  
  