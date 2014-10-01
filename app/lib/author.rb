require 'csv'
require 'pry'

class Author < Person
  def initialize(args)
    super(args)
    @author_capability = true
  end

  def self.author_hash
    author_hash = { 
      full_name: "Amanda Raymond", 
      gender: "female",  
      marital_status: "no",  
      age: 26, 
      nickname: "the Dude",
    } 
  end

  def author_info(person, array_of_persons) 
    puts "\nHere is the author's info:"
    puts array_of_persons.reject { |person| person[:full_name] != "Amanda Raymond" }.first
  end
end