#Our CLI Controller
class ProgramScraper::CLI
  
  def call
    ProgramScraper::Scraper.new.program_details
    puts "Welcome to the Sinclair's Online Programs"
    list_programs
    start
    goodbye
  end
  
  def list_programs
    # get programs
    @programs = ProgramScraper::Program.all
    @programs.each.with_index(1) do |program, i|
      puts "#{i}. #{program.name}"
    end
  end
    
  def start
    input = nil
    while input != "exit"
      puts "Enter the number of the program you'd like more info on or or type list to see the programs again or type exit to exit:"
      input = gets.strip.downcase
      if input.to_i > 0
        program = ProgramScraper::Program.find(input.to_i)
        print_program(program)
      elsif input == "list"
        list_programs
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end
  
  def print_program(program)
    puts ""
    puts "----------- #{program.name} - #{program.degree_type} -----------"
    puts ""
    puts "Division:            #{program.division}"
    puts "Department:          #{program.department}"
    puts "Contact:             #{program.contact}"
    puts "Website:             #{program.url}"
    puts "---------------Outcomes--------------" 
    puts ""
    puts "#{program.outcomes}"
    # puts ""
    # puts "--------Career Opportunities---------"
    # puts ""
    # puts "#{program.career_opportunity}"
    # puts ""
    # puts "---------------Description--------------"
    # puts ""
    # puts "#{program.description}"
    # puts ""
  end
  
  def goodbye
    puts "Goodbye! Thanks for checking our app."
  end
    
end