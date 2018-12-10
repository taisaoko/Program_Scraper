#Our CLI Controller
class ProgramScraper::CLI
  
  def call
    ProgramScraper::Scraper.program_details
    puts "Welcome to the Sinclair's Online Programs"
    list_programs
    start
  end
  
  def list_programs
    # get programs
    ProgramScraper::Program.all.each.with_index(1) do |program, i|
      puts "#{i}. #{program.name}"
    end
  end
    
  def start
    input = nil
    while input != "exit"
      puts "Enter the number of the program you'd like more info on or or type list to see the programs again or type exit to exit:"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i <= ProgramScraper::Program.all.size 
        program = ProgramScraper::Program.find(input.to_i)
        ProgramScraper::Scraper.scrape_details(program) if program.degree_type == nil
        print_program(program)
      elsif input == "list"
        list_programs
      elsif input == "exit"
        puts "Goodbye! Thanks for checking our CLI app."
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
  end
  
end