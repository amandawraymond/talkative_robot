require 'csv'
require 'pry'

class Person
  def initialize(person)
    @full_name        = person[:full_name]
    @gender           = person[:gender]
    @marital_status   = person[:marital_status]
    @age              = person[:age]
    @nickname         = person[:nickname]
    @recreation       = person[:recreation]
  end

  def self.get_person_info
    person = {}
    
    puts "What is your full name?"
    person[:full_name] = gets.chomp


    puts "Are you a male or female homo sapien?"
    person[:gender] = gets.chomp
    

    puts "Are you married?"
    person[:marital_status] = gets.chomp.downcase
    
    puts "How old are you?"
    person[:age] = gets.chomp.to_i
    
    person
  end

  def print_age_appropriate_sentence
    if young?
      "I can't believe you are so young!\n\n"
    elsif old?
      "I bet you are a grandparent!\n\n"
    else
      "You must be in your prime!\n\n"
    end
  end

  def print_age_compared_to_author
    if older_than_author?
      "It looks like you are older than me!!!\n\n"
    elsif younger_than_author?
      "It looks like you are younger than me!!\n\n"
    else 
      "You might be the same age as me!?\n\n" 
    end 
  end

  def nickname_question
    puts "Would you like me to give you a nickname? (yes, no, or maybe)"
    @nickname_answer = gets.chomp.downcase
  end

  def nickname_sentence
    case @nickname_answer
    when "yes"
      "Okay \"The Dude\" it is... I was going to just call #{first_initial} but it doesnt seem to fit!\n\n"
    when "no"
      "Well #{first_name} I am going to call you \"The Dude\" anyways..."
    when "maybe"
      "This is so like you \"The Dude\", not being able to decide...and to think I almost called you #{first_initial}.\n\n"
    else 
      "You are being such a dude so I am going to call you \"the Dude\"\n\n"
    end
  end

  def more_questions_statement
    "Sooo #{@nickname}, I am going to ask you a few more questions if you don't mind?...\n\n"
  end

  def surname_message
    puts (male?) ? "sooo you're saying you are a male\n\n" : "So you're telling me you are a female\n\n"
    if female? && !married?
      puts "Miss.#{last_name} I can see you are #{@age} years old!\n\n"
    elsif female? && married?
      puts "Mrs.#{last_name} I can see you are #{@age} years old!\n\n"
    elsif male?
      puts "Mr.#{last_name} I can see you are #{@age} years old!\n\n"
    else
      puts "#{@full_name} I can see you are #{@age} years old!\n\n"
    end
  end

  def person_compared_to_age_75
    years_til_75 = 75 - @age
    years_at_75 = 2014 + years_til_75
    
    puts "You will be 75 years old in #{years_til_75} years which will put us at #{years_at_75}!\n\n" unless old?
  end

  def recreation_question
    puts "What do you do for recreation?"
    @recreation = gets.chomp.downcase
    puts "Glad to hear you like #{@recreation}, I thought you were going to say bowling! \n\n"
  end

  def select_by_name(array_of_users, full_name)
    puts "\nHere is all the information given about #{full_name}:\n\n"
    puts array_of_users.select { |person| person[:full_name] == full_name }.first
  end

  def old?
    @age > 75
  end
  
  def young?
    @age < 25
  end

  def older_than_author?
    @age > 26
  end

  def younger_than_author?
    @age < 26
  end

  def nickname_answer=(nickname_answer)
    @nickname_answer = nickname_answer
  end

  def nickname
    @nickname ||= "The Dude"
  end

  def married?
    @marital_status = @marital_status.downcase
    @marital_status == "yes" || @marital_status == "y" || @marital_status == "yup"
  end

  def male?
    @gender = @gender.downcase
    @gender == "male" || @gender == "m" || @gender == "guy" || @gender == "dude"
  end

  def female?
    @gender = @gender.downcase
    @gender == "female" || @gender == "f" || @gender == "girl" || @gender == "chica"
  end

  def first_name
    @first_name ||= @full_name.split(" ").first
  end

  def last_name
    @last_name ||= @full_name.split(" ").last
  end

  def first_initial
    @first_initial ||= first_name.chars[0]
  end
end
