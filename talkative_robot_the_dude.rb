require 'pry'

puts "What is your full name?"
 
user_full_name = gets.chomp
 
user_first_name = user_full_name.split(" ").first
#ask how old is the (user's first name only)

user_last_name = user_full_name.split(" ").last
#ask how old is the (user's first name only)

puts " Are you a male or female homo sapien?"
gender_full = gets.chomp.downcase
gender_short = gender_full.chars.first

puts (gender_short == "m") ? "sooo you're saying you are a male" : "So you're telling me you are a female"

puts "Are you married?"
marital_status = gets.chomp.downcase
marital_status_short = marital_status.chars.first


surname = "Mr." if gender_short == "m"

surname = "Miss." if gender_short == "f" && marital_status_short == "n"

surname = "Mrs." if gender_short == "f" && marital_status_short == "y"

puts "How old are you #{surname}#{user_last_name}?"

user_age = gets.chomp.to_i


if user_age < 20
	print "I can't believe you are #{user_age} years old!\n"
elsif user_age > 75
	puts "Are you a grandparent #{surname}#{user_last_name}?"
	grandparent = gets.chomp.downcase
else
	puts "Yea, in your prime!"
end

case
when user_age < 75
	puts "#{surname}#{user_last_name} you are a young!"
when user_age > 75 
	puts "#{surname}#{user_last_name} you are a old!"
else 
	puts "#{surname}#{user_last_name}You are right at the cusp of being old!"
end



years_til_75 = 75 - user_age

current_year = 2014

years_at_75 = current_year + years_til_75

puts "You will be 75 years old in #{years_til_75} years which will put us at #{years_at_75}!\n" unless user_age > 75

if years_at_75 < 2063
	puts "It looks like you are older than me!!!"
elsif years_at_75 > 2063
	puts "It looks like you are younger than me!!"
else 
	puts "You might be the same age as me!?" 
end 


user_full_name.upcase!

puts "Hey #{user_full_name}, where are you going? Don't leave yet!\n"

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
		puts 'I\'m sorry I could not understand you... typical of you "the Dude"'
	end

puts %s(So "Dude", what's up?)

puts "What is your favorite drink?"

drink = gets.chomp.downcase

puts "Keeping it classy i seeeee...one #{drink} coming right up!\n\n"

puts "What do you do for recreation?"

recreation = gets.chomp.downcase

puts "Glad to hear you like #{recreation}, I thought you were going to say bowling! \n\n"

puts "Well I know your favorite movie is The Big Lebowski so I won't even ask. \n\n"

puts """And I know you are busy with your buisness, 
lot of facets and interesting parties involved, 
so I\'ll leave you to it the Dude. Keep abiding!"""













