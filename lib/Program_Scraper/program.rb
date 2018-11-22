class ProgramScraper::Program
attr_accessor :name,:url, :degree_type,  :contact, :division, :department,:about, :outcomes, :career_opportunity
  
  @@all = []
  
  def self.new_from_index_page(r)
    self.new(r.text,
      "https://www.sinclair.edu#{r.css("a").attribute("href").text}",
      )
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
  
  def degree_type
    @degree_type ||= doc.css(".row h5")[1].text
  end
  
  def contact
    @contact ||= doc.css(".panel-body").text.split.join(" ")
  end
  
  def division
    @division ||= doc.css("a")[30].text 
    #doc.css("a")[30].attributes("href").text
  end
  
  def department
    @department ||= doc.css("a")[31].text 
    #doc.css("a")[30].attributes("href").text
  end
  
  def about
    @about ||= doc.css(".col-md-9.col-sm-8.col-12.content").children[10].text.split.join(" ")
  end
  
  def outcomes
    @outcomes ||= doc.css("section.col-md-9.col-sm-8.col-12.content ul li").text
  end
  
  def career_opportunity
    if @contact == ""
      @career_opportunity = doc.css("p")[1].text
    else 
      @career_opportunity = doc.css("p")[3].text
    end
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
  
  
end