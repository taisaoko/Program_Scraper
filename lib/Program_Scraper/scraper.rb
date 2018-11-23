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
  
end