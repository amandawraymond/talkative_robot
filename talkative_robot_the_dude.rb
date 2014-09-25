require 'pry'

def age_appropriate_sentence(age)
	if age < 20
		print "I can't believe you are so young!\n"
	elsif age > 75
		puts "Are you a grandparent?"
		grandparent = gets.chomp.downcase
	else
		puts "You must be in your prime!"
	end
end

def age_compared_to_me(age)
	if age > 26
		puts "It looks like you are older than me!!!"
	elsif age < 26
		puts "It looks like you are younger than me!!"
	else 
		puts "You might be the same age as me!?" 
	end 
end

def nickname_answer(answer,full_name)
	case answer
		when "yes"
			puts "Okay \"The Dude\" it is... I was going to just call #{full_name.chars[0]} but it doesnt seem to fit!"
		when "no"
			puts "Well #{full_name.split(" ").first} I am going to call you \"The Dude\" anyways..."
		when "maybe"
			puts "This is so like you \"The Dude\", not being able to decide...and to think I almost called you #{full_name.chars[0]}."
		else 
			puts 'I\'m sorry I could not understand you... typical of you "the Dude"'
		end
end

def surname(user)
	if user[:gender_short] == "f" && user[:marital_status_short] == "n"
		puts "Hello Mrs.#{user[:last_name]}!"
	elsif user[:gender_short] == "f" && user[:marital_status_short] == "y"
		puts "Hello Miss.#{user[:last_name]}!"
	elsif user[:gender_short] == "m"
		puts "Hello Mr.#{user[:last_name]}!"
	else
		puts "Okay Human named #{user[:full_name]}, I won't ask you that question again!"
	end
end

def dudes_favorite_movie
	puts "Well I know your favorite movie is The Big Lebowski! \n\n"
end

user = {}

puts "What is your full name?"
user[:full_name] = gets.chomp
user[:first_name] = user[:full_name].split(" ").first
user[:last_name] = user[:full_name].split(" ").last


puts "Are you a male or female homo sapien?"
user[:gender_full] = gets.chomp.downcase
user[:gender_short] = user[:gender_full].chars.first
puts (user[:gender_short] == "m") ? "sooo you're saying you are a male" : "So you're telling me you are a female"

puts "Are you married?"
user[:marital_status] = gets.chomp.downcase
user[:marital_status_short] = user[:marital_status].chars.first

surname(user)
 
puts "How old are you?"
user[:age] = gets.chomp.to_i
age_compared_to_me(user[:age])
age_appropriate_sentence(user[:age])

user[:years_til_75] = 75 - user[:age]
current_year = 2014
user[:years_at_75] = current_year + user[:years_til_75]
puts "You will be 75 years old in #{user[:years_til_75]} years which will put us at #{user[:years_at_75]}!\n" unless user[:age] > 75
puts "Hey #{user[:full_name].upcase}, where are you going? Don't leave yet!\n"

puts "Would you like me to give you a nickname? (yes, no, or maybe)"
user[:nickname_answer] = gets.chomp.downcase
nickname_answer(user[:nickname_answer], user[:full_name])

puts %s(So "Dude", what's up?)

puts "What is your favorite drink?"
user[:drink] = gets.chomp
puts "Keeping it classy i seeeee..well I dont have that here. But I'll add it to my grocery list!\n\n"

grocery = ["peanut_butter", "apples", "chicken", "bread", "soda"]
random_item = grocery.sample
puts "I made a grocery list..I really really need to buy #{random_item}, so remind me!"
puts "Wait! Did you already bought some #{random_item}?"
random_item_bought = gets.chomp.downcase
grocery.delete(random_item) if random_item_bought == "yes"
puts "Okay! sounds good, I will try not to forget your #{user[:drink]}."
grocery.unshift(user[:drink])



puts "What do you do for recreation?"
user[:recreation] = gets.chomp.downcase
puts "Glad to hear you like #{user[:recreation]}, I thought you were going to say bowling! \n\n"

dudes_favorite_movie
	
puts """And I know you are busy with your buisness, 
lot of facets and interesting parties involved, 
so I\'ll leave you to it the Dude. Keep abiding!"""















