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
   
      # doc.css(".social-icon-container a").each do |a|
        
      #   if (a.attribute("href").value).include?("twitter")
      #     student_page[:twitter] = a.attribute("href").value
      #   elsif (a.attribute("href").value).include?("linkedin")
      #     student_page[:linkedin] = a.attribute("href").value
      #   elsif (a.attribute("href").value).include?("github")  
      #     student_page[:github] = a.attribute("href").value
      #   else 
      #     student_page[:blog] = a.attribute("href").value
      #   end
      
      # end
    program_page[:degree_type] = doc.css("div.row h5")[1].text
    program_page[:contact] = doc.css("div.panel_body")
    program_page[:career_opportunity] = doc.css("p")[4].text
    binding.pry
    program_page
  end
end