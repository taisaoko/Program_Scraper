Define my execution point (./bin/run)
Stub out a quick environment (anything that needs env can just load it through require './lib/Program_Scraper')
My bin file(./bin/run) creates a new incident of my controller CLI by calling the #call (which #list_programs, #detail, #goodbye)

- A CLI for Online One-Year Certificate Programs

User types program-scraper

Show a list of programs:
#self.all

    # return a bunch of instances of Program
    # puts <<-DOC.gsub /^\s*/,''
    
    # 1. Business Management - 30 credit hours
    # 2. Business Transfer - 30 credit hours
    # 3. Corrections
    # 4. Health Information Management Technician
    # 5. Law Enforcement
    # 6. Supervisory Skills
    # 7. Supply Chain Management
    # DOC

Which programs do you want to know more about?

- What is a program?
A program has a name
A program has a URL
A program has a number of credits
A program has a career opportunity
A program has a contact