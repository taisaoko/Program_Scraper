require 'nokogiri'
require 'open-uri'
require 'pry'

class ProgramScraper::Scraper

  def self.scrape_index_page
    doc = Nokogiri::HTML(open("http://sinclair.edu/academics/online/"))
    program_list = []
    
    doc.css(".col-xl-8.col-12 ul li a").children.each do |children|
      program_list << children.text
    end
    program_list
    
  end
end