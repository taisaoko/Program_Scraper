#Our CLI Controller
class ProgramScraper::CLI
  
  def call
    
    list_programs
    detail
  end
  
  def list_programs
    # get programs
    # Here Doc
    puts "Today's One-Year Certificate Programs:"
    puts <<-DOC.gsub /^\s*/,''
    
    1. Business Management
    2. Business Transfer
    3. Corrections
    4. Health Information Management Technician
    5. Law Enforcement
    6. Supervisory Skills
    7. Supply Chain Management
    DOC
  end
    
  def detail
    puts "Enter the number of the program you'd like more info on or type exit to enter"
    input = gets.strip
    case input
      when "1"
        puts "More info on program 1 ..."
      when "2"
        puts "More info on program 2 ..."
  end
    
end