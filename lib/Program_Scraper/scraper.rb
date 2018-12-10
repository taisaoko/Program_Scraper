class ProgramScraper::Scraper

  def self.scrape_index_page
    # Scrape Sinclair website and return programs based on that data ("http://sinclair.edu/academics/online/")
    doc = Nokogiri::HTML(open("http://sinclair.edu/academics/online/"))
    doc.css(".col-xl-8.col-12 ul li")
  end
  
  def self.program_details
    self.scrape_index_page[0...-1].each do |r|
      ProgramScraper::Program.new(r.text, "https://www.sinclair.edu#{r.css("a").attribute("href").text}")
    end
  end
  
  def self.scrape_details(program)
    doc = Nokogiri::HTML(open(program.url))
    program.degree_type = doc.css(".row h5")[1].text
    program.contact = doc.css(".panel-body").text.split.join(" ")
    program.division = doc.css("a")[30].text 
    program.department = doc.css("a")[31].text
    program.outcomes = doc.css("section.col-md-9.col-sm-8.col-12.content ul li").text
  end
  
end