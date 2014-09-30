require 'csv'
require 'pry'

class Person

	def initialize(user)

		@full_name  	      = user[:full_name]
		@gender 			  = user[:gender]
		@marital_status 	  = user[:marital_status]
		@age 				  = user[:age]
		@nickname             = user[:nickname]
		@recreation 		  = recreation
		set_marital_status_short
		set_gender_short
		set_first_name
		set_last_name
		set_first_initial
	end


	def self.get_user_info
		
		user = {}
		
		puts "What is your full name?"
		user[:full_name] = gets.chomp


		puts "Are you a male or female homo sapien?"
		user[:gender] = gets.chomp
		

		puts "Are you married?"
		user[:marital_status] = gets.chomp.downcase
		
		puts "How old are you?"
		user[:age] = gets.chomp.to_i
		
		user

	end


	def print_age_appropriate_sentence
		if @age < 20
			print "I can't believe you are so young!\n"
		elsif @age > 75
			puts "Are you a grandparent?"
			grandparent = gets.chomp.downcase
		else
			puts "You must be in your prime!"
		end
	end

	def print_age_compared_to_me
		if @age > 26
			puts "It looks like you are older than me!!!"
		elsif @age < 26
			puts "It looks like you are younger than me!!"
		else 
			puts "You might be the same age as me!?" 
		end 
	end

	def nickname_question
		
		puts "Would you like me to give you a nickname? (yes, no, or maybe)"
		nickname_answer = gets.chomp.downcase

			case nickname_answer
			when "yes"
				puts "Okay \"The Dude\" it is... I was going to just call #{@first_initial} but it doesnt seem to fit!"
			when "no"
				puts "Well #{@first_name} I am going to call you \"The Dude\" anyways..."
			when "maybe"
				puts "This is so like you \"The Dude\", not being able to decide...and to think I almost called you #{@first_initial}."
			else 
				puts 'You are being such a dude so I am going to call you "the Dude"'
			end
		@nickname = "the Dude"
		puts "Sooo #{@nickname}, I am going to ask you a few more questions if you don't mind?"
	end

	def surname
		puts (@gender_short == "m") ? "sooo you're saying you are a male" : "So you're telling me you are a female"
		
			if @gender_short == "f" && @marital_status == "n"
				puts "Mrs.#{@last_name} I can see you are #{@age} years old!"
			elsif @gender_short == "f" && @marital_status == "y"
				puts "Miss.#{@last_name} I can see you are #{@age} years old!"
			elsif @gender_short == "m"
				puts "Mr.#{@last_name} I can see you are #{@age} years old!"
			else
				puts "#{@full_name} I can see you are #{@age} years old!"
			end
	end

	def user_compared_to_age_75
		years_til_75 = 75 - @age
		years_at_75 = 2014 + years_til_75

		puts "You will be 75 years old in #{years_til_75} years which will put us at #{years_at_75}!\n" unless @age > 75
		
		puts "Hey #{@full_name.upcase}, where are you going? Don't leave yet!\n"
	end

	def recreation_question
		puts "What do you do for recreation?"
		@recreation = gets.chomp.downcase
		puts "Glad to hear you like #{@recreation}, I thought you were going to say bowling! \n\n"
	end

	protected

		def set_martial_status_short
			@marital_status = @marital_status.downcase.chars.first
		end

		def set_gender_short
			@gender= @gender.downcase
			@gender_short = @gender.chars.first
		end

		def set_first_name
			@first_name = @full_name.split(" ").first
		end

		def set_last_name
			@last_name = @full_name.split(" ").last
		end

		def set_first_initial
			@first_initial = @first_name.chars[0]
		end
	
end

class User < Person
	def initialize(user)
		super
	end
end

class Author < Person
	
	def initialize(user)
		super
	end
	
	def self.define_author_hash

	author_hash = { full_name: "Amanda Raymond", 
		gender: "female",  
		marital_status: "no",  
		age: 26, 
		nickname: "the Dude",
	}
	
	end
end

class Movies
	
	def initialize
	end

	def self.dudes_favorite_movie
		puts "I know your favorite movie is The Big Lebowski so I won't even ask! \n\n"
	end

	def self.read_csv(csv_file)
	 	col_data = []
	 	csv = CSV.foreach(csv_file) do |row| # each row =  is actually columns in my mind
	 		col_data << row[0] + "  " + row[1]
	 	end
	 	col_data
	 end
end


class GroceryList

	def initialize(user)
		gets_grocery_list
		gets_drink
		produce_random_item
	end

	def gets_grocery_list
		puts " I am going to the store. What text file do you want me to pull in as our grocery_list?"
		text_file = gets.chomp.to_s
 		@grocery_list = IO.read(text_file).chomp.split(", ")
	end

	def remind_me
		produce_random_item
		puts "I really really need to buy #{@random_item}, so remind me!"
	end

	def print_grocery_list
		puts "Here is our updated grocery list so far: #{@grocery_list.join(", ")}"
	end

	def delete_random_item
		puts "Wait! Did you already buy some #{@random_item}?"
		random_item_bought = gets.chomp.downcase
		random_item_bought_short = random_item_bought.chars.first
		@grocery_list.delete(@random_item) if random_item_bought_short == "y"

    end

    def gets_drink
		puts "What is your favorite drink?"
		@drink = gets.chomp
	end


    def need_to_add_drink(nickname)
		puts "Keeping it classy #{nickname} i seeeee..well I dont have any #{@drink} here. But I'll add it to my grocery list!\n\n"
		puts "Okay! sounds good, I will try not to forget your #{@drink} when I go to the store later."
		@grocery_list.unshift(@drink)
	end

	def write_to_csv(csv_file)
	 	IO.write(csv_file, @grocery_list.join(", "))
	end
	
	def headered_csv_grocery_list(csv_file)
		
		CSV.open(csv_file, "w") do |csv|
	   
	   		csv << ["Item Number", "Item Name"]
       		@grocery_list.each_index do |i| 
	   		csv << [ "#{i+1}", @grocery_list[i]] 
	   		# grocery_list.each_index { |index| csv << [index + 1, grocery_list[index]] }
			end
		end
	end
	
	protected

		def produce_random_item
			@random_item ||= @grocery_list.sample
		end
end


def select_by_name(array_of_users, full_name)
	puts "\nHere is all the information given about #{full_name}:"
	puts array_of_users.select { |person| person[:full_name] == full_name }.first
end

def author_info(person, array_of_persons)	
	puts "\nHere is the author's info:"
	puts array_of_persons.reject { |person| person[:full_name] != "Amanda Raymond" }.first
end

def farewell_statement
	puts """\n\tAnd I know you are busy with your buisness, 
	lot of facets and interesting parties involved, 
	so I'll leave you to it the Dude. Keep abiding!"""
end




user_info = User.get_user_info
@current_user = User.new(user_info)

author_info = Author.define_author_hash
@author_me = Author.new(author_info)
people = [user_info, author_info]

@current_user.surname
@current_user.print_age_compared_to_me
@current_user.print_age_appropriate_sentence
@current_user.nickname_question

@our_grocery_list = GroceryList.new(@current_user)
@our_grocery_list.remind_me
@our_grocery_list.print_grocery_list
@our_grocery_list.delete_random_item
@our_grocery_list.need_to_add_drink(@nickname)
@our_grocery_list.write_to_csv("grocery_list_2.txt")
@our_grocery_list.headered_csv_grocery_list("grocery_list_headered.txt")
@our_grocery_list.print_grocery_list

recreation_question
dudes_favorite_movie
puts "Here is the author's ranking of movies:"
read_csv("movie_rankings.csv")
farewell_statement
select_by_name(people, user_info[:full_name])
author_info(author_info, people)















