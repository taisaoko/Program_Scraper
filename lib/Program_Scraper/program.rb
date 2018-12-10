class ProgramScraper::Program
attr_accessor :name, :url, :degree_type, :contact, :division, :department, :description, :outcomes, :career_opportunity
  
  @@all = []
  
  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.find(id)
    self.all[id-1]
  end
end