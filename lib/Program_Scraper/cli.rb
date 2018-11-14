#Our CLI Controller
class ProgramScraper::CLI
  
  def call
    list_programs
    detail
    goodbye
  end
  
  def list_programs
    # get programs
    # Here Doc
    puts "Sinclair's Online One-Year Certificate Programs:"
    @programs = ProgramScraper::Program.all
  end
    
  def detail
    puts "Enter the number of the program you'd like more info on or or type list to see the programs again or type exit to exit:"
    input = nil
    while input != "exit"
    input = gets.strip.downcase
      case input
        when "1"
          puts "More info on program 1 ..."
        when "2"
          puts "More info on program 2 ..."
        when "3"
          puts "More info on program 3 ..."
        when "4"
          puts "More info on program 4 ..."
        when "5"
          puts "More info on program 5 ..."
        when "6"
          puts "More info on program 6 ..."
        when "7"
          puts "More info on program 7 ..."
        when "list"
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