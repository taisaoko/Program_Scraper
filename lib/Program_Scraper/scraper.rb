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
  
  
  def self.scrape_program_page(url)
    html = open(url)
    doc = Nokogiri::HTML(html)
    program_page = {}
   
      #program_page[:contact] = doc.css("div.c-4.nr.nt ul:nth-child(10) li:nth-child(1)").text.split("+").join(". Tel: +")
      
    program_page[:name] = doc.css(".row h1").text  
    program_page[:degree_type] = doc.css(".row h5")[1].text
    program_page[:about] = doc.css(".col-md-9.col-sm-8.col-12.content").children[10].text.split.join(" ")
    program_page[:contact] = doc.css(".panel-body").text.split.join(" ")
      if program_page[:contact] == ""
        program_page[:career_opportunity] = doc.css("p")[1].text
      else 
        program_page[:career_opportunity] = doc.css("p")[3].text
      end  
    
    binding.pry
    program_page
  end
end