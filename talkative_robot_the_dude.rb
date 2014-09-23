

puts "What is your full name?"
 
user_full_name = gets.chomp
 
user_first_name = user_full_name.split(" ").first
#ask how old is the (user's first name only)

user_last_name = user_full_name.split(" ").last
#ask how old is the (user's first name only)

puts "How old are you #{user_first_name}?"

user_age = gets.chomp.to_i

puts "Hi #{user_full_name} who is #{user_age} years old!\n"

years_til_75 = 75 - user_age

current_year = 2014

year_at_75 = current_year + years_til_75

puts "You will be 75 years old in #{years_til_75} years which will put us at #{year_at_75}!\n"

user_full_name.upcase!

puts "Hey #{user_full_name}, where are you going?\n"

first_initial = user_full_name.chars[0]

puts "Would you like me to give you a nickname? (yes, no, or maybe)"

nickname_agreement = gets.chomp.downcase

case nickname_agreement
	when "yes"
		puts "Okay \"The Dude\" it is... I was going to just call #{first_initial} but it doesnt seem to fit!"
	when "no"
		puts "Well #{user_first_name} I am going to call you \"The Dude\" anyways..."
	when "maybe"
		puts "This is so like you \"The Dude\", not being able to decide...and to think I almost called you #{user_last_name}."
	else 
		puts "I'm sorry I could not understand you... typical of you \"the Dude\""
	end

puts %s(So "Dude", what's up?)

puts "What is your favorite drink?"

drink = gets.chomp.downcase

puts "Keeping it classy i seeeee...one #{drink} coming right up!"

puts "What do you do for recreation?"

recreation = gets.chomp.downcase

puts "Glad to hear you like #{recreation}, I thought you were going to say bowling!\n"

puts "Well I know your favorite movie is The Big Lebowski so I won't even ask."

puts "And I know you are busy with your buisness, lot of facets and interesting parties involved, so I\'ll leave you to it the Dude. Keep abiding!"













