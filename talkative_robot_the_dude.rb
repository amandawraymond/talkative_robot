require 'pry'

def get_user_info
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
	

	puts "How old are you?"
	user[:age] = gets.chomp.to_i
	
	user
end

def print_age_appropriate_sentence(user)
	if user[:age] < 20
		print "I can't believe you are so young!\n"
	elsif user[:age] > 75
		puts "Are you a grandparent?"
		grandparent = gets.chomp.downcase
	else
		puts "You must be in your prime!"
	end
end

def print_age_compared_to_me(user)
	if user[:age] > 26
		puts "It looks like you are older than me!!!"
	elsif user[:age] < 26
		puts "It looks like you are younger than me!!"
	else 
		puts "You might be the same age as me!?" 
	end 
end

def nickname_question(user)
	
	puts "Would you like me to give you a nickname? (yes, no, or maybe)"
	user[:nickname_answer] = gets.chomp.downcase

	case user[:nickname_answer]
		when "yes"
			puts "Okay \"The Dude\" it is... I was going to just call #{user[:full_name].chars[0]} but it doesnt seem to fit!"
		when "no"
			puts "Well #{user[:full_name].split(" ").first} I am going to call you \"The Dude\" anyways..."
		when "maybe"
			puts "This is so like you \"The Dude\", not being able to decide...and to think I almost called you #{user[:full_name].chars[0]}."
		else 
			puts 'You are being such a dude so I am going to call you "the Dude"'
		end
		user[:nickname] = "the Dude"
		puts "Sooo #{user[:nickname]}, I am going to ask you a few more questions if you don't mind?"
end

def surname(user)
	if user[:gender_short] == "f" && user[:marital_status_short] == "n"
		puts "Well hello Mrs.#{user[:last_name] } who is #{user[:age]} years old!"
	elsif user[:gender_short] == "f" && user[:marital_status_short] == "y"
		puts "Well hello Miss.#{user[:last_name]} who is #{user[:age]} years old!"
	elsif user[:gender_short] == "m"
		puts "Well hello Mr.#{user[:last_name]} who is #{user[:age]} years old!"
	else
		puts "Okay Human named #{user[:full_name]} who is #{user[:age]} years old, I won't ask you that question again!"
	end
end

def user_compared_to_age_75(user)
	user[:years_til_75] = 75 - user[:age]
	user[:years_at_75] = 2014 + user[:years_til_75]

	puts "You will be 75 years old in #{user[:years_til_75]} years which will put us at #{user[:years_at_75]}!\n" unless user[:age] > 75
	
	puts "Hey #{user[:full_name].upcase}, where are you going? Don't leave yet!\n"
end

def drink_question(user)
	puts "What is your favorite drink #{user[:nickname]}?"
	user[:drink] = gets.chomp
	puts "Keeping it classy i seeeee..well I dont have any #{user[:drink]} here. But I'll add it to my grocery list!\n\n"
end

def grocery_question(user)
	grocery = ["peanut butter", "apples", "chicken", "bread", "soda"]
	
	random_item = grocery.sample
	puts "I made a grocery list: #{grocery.join(", ")}..I really really need to buy #{random_item}, so remind me!"
	puts "Wait! Did you already buy some #{random_item}?"
	random_item_bought = gets.chomp.downcase
	random_item_bought_short = random_item_bought.chars.first
	grocery.delete(random_item) if random_item_bought_short == "y"
	
	puts "Okay! sounds good, I will try not to forget your #{user[:drink]} when I go to the store later."
	grocery.unshift(user[:drink])

	grocery_list = grocery.each_index {|i| puts "Item #{i+1} -- #{grocery[i]}"}

	puts "Checkout my grocery list to make sure I got it right: #{grocery_list}."

end

def recreation_question(user)
	puts "What do you do for recreation?"
	user[:recreation] = gets.chomp.downcase
	puts "Glad to hear you like #{user[:recreation]}, I thought you were going to say bowling! \n\n"
end

def dudes_favorite_movie
	puts "I know your favorite movie is The Big Lebowski so I won't even ask! \n\n"
end

def farewell_statement
	puts """And I know you are busy with your buisness, 
	lot of facets and interesting parties involved, 
	so I'll leave you to it the Dude. Keep abiding!"""
end


the_user = get_user_info
surname(the_user)
print_age_compared_to_me(the_user)
print_age_appropriate_sentence(the_user)
nickname_question(the_user)
drink_question(the_user)
grocery_question(the_user)
recreation_question(the_user)
dudes_favorite_movie
farewell_statement


# grocery_list = IO.read("grocery_list.txt").chomp.split(", ")
# grocery_list.map! {|item| item.downcase}
# IO.write("new_grocery_list.txt", grocery_list)

#  grocery_list_hash = Hash[grocery_list.map.with_index.to_a]
# grocery_list_hash.map {|object, number| puts "Item #{number} -- #{object}" }


author = { full_name: "Amanda Raymond", first_name: "Amanda", last_name: "Raymond", gender_full: "female", gender_short: "f", marital_status: "no", marital_status_short: "n", age: 26, nickname_answer: "yes", nickname: "the Dude", drink: "Diet Coke", recreation: "play soccer"}

people = [the_user, author]

# people = [user,author]

# puts "#{people[1]}"

puts "I, Amanda Raymond, am the author of this program" if people.reject {|i| i[:full_name] != "Amanda Raymond"}
puts " And here is some information about me:"

print author if people.select {|i| i[:first_name] = "Amanda"}


















