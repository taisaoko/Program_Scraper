require 'nokogiri'
require 'open-uri'
require 'pry'

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
  
  
  # def self.scrape_program_page(url)
  #   # Scrape Sinclair's individual program website and return more info (url)
  #   html = open(url)
  #   doc = Nokogiri::HTML(html)
  #   program_page = {}
   
  #   program_page[:name] = doc.css(".row h1").text  
  #   program_page[:degree_type] = doc.css(".row h5")[1].text
  #   program_page[:contact] = doc.css(".panel-body").text.split.join(" ")
  #   program_page[:division] = doc.css("a")[30].text #doc.css("a")[30].attributes.values[0].text
  #   program_page[:department] = doc.css("a")[31].text #doc.css("a")[30].attributes.values[0].text
  #   program_page[:about] = doc.css(".col-md-9.col-sm-8.col-12.content").children[10].text.split.join(" ")
  #   program_page[:outcomes] = doc.css("section.col-md-9.col-sm-8.col-12.content ul li").text
  #   if program_page[:contact] == ""
  #     program_page[:career_opportunity] = doc.css("p")[1].text
  #   else 
  #     program_page[:career_opportunity] = doc.css("p")[3].text
  #   end  
    
  #   binding.pry
  #   program_page
  # end
end