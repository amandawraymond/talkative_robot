

the_user = {drink: "water"}

author = { full_name: "Amanda Raymond", first_name: "Amanda", last_name: "Raymond", gender_full: "female", gender_short: "f", marital_status: "no", marital_status_short: "n", age: 26, nickname_answer: "yes", nickname: "the Dude", drink: "Diet Coke", recreation: "play soccer"}

people = [the_user, author]

# puts "#{people[1]}"

puts "I, Amanda Raymond, am the author of this program" if people.reject {|i| i[:full_name] != "Amanda Raymond"}
puts "And here is some information about me:"

# print author if people.select {|i| i[:first_name] == "Amanda"}

print people.select {|i| i[:first_name] == "Amanda"}.first

grocery = ["peanut butter", "apples", "chicken", "bread", "soda"]
# grocery.unshift("Grocery list:)

grocery_list_transferred = IO.write("grocery_list.txt", grocery.join(", "))
grocery_list_pull_in = IO.read("grocery_list.txt").chomp.split(", ")




def grocery_question(user)
	# grocery = ["peanut butter", "apples", "chicken", "bread", "soda"]
	grocery_list_transferred = IO.write("grocery_list.txt", grocery.join(", "))
	grocery_list_pull_in = IO.read("grocery_list.txt").chomp.split(", ")
	
	random_item = grocery_list_pull_in.sample
	puts "I made a grocery list: #{grocery_list_pull_in.join(", ")}..I really really need to buy #{random_item}, so remind me!"
	puts "Wait! Did you already buy some #{random_item}?"
	random_item_bought = gets.chomp.downcase
	random_item_bought_short = random_item_bought.chars.first
	grocery_list_pull_in.delete(random_item) if random_item_bought_short == "y"
	
	puts "Okay! sounds good, I will try not to forget your #{user[:drink]} when I go to the store later."
	grocery_list_pull_in.unshift(user[:drink])

	grocery_list_final = grocery_list_pull_in.each_index {|i| puts "Item #{i+1} -- #{grocery[i]}"}

	puts "Checkout my grocery list to make sure I got it right: #{grocery_list}."

end
 
IO.write("grocery_list_2.txt", grocery_list_pull_in.join(", "))

