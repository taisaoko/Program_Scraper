#Our CLI Controller
class ProgramScraper::CLI
  
  def call
    list_programs
    
  end
  
  def list_programs
    # get programs
    # Here Doc
    puts "Sinclair's Online Programs:"
    @programs = ProgramScraper::Scraper.new.program_details
    @programs.each.with_index(1) do |program, i|
      puts "#{i}. #{program}"
    end
  end
    
  def detail
    input = nil
    while input != "exit"
      puts "Enter the number of the program you'd like more info on or or type list to see the programs again or type exit to exit:"
      input = gets.strip.downcase
      if input.to_i > 0
        the_program = @programs[input.to_i-1]
        puts "#{the_program.name} - #{the_program.credit}"
      elsif input == "list"
        list_programs
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end
  
  def goodbye
    puts "Goodbye! Thanks for checking our app."
  end
    
end