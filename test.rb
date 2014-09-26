def print_greeting
    puts "Greetings, Human!"
end

def get_user_info
    user = {}
    puts "What is your name? "
    user[:name] = gets.chomp

    puts "What is your age? "
    user[:age] = gets.chomp.to_i
    
end

def print_friendly_greeting(user)
    puts "Hi #{user[:name]} who is #{user[:age]} years old!"
end

def ask_user?(question)
    answer = ""
    while answer != "yes" && answer != "no"
        puts question
        answer = gets.chomp.downcase
    end
    answer == "yes" ? true : false
end

def ask_user_about_nickname(user)
    first_initial = user[:name].chars.first
    answer = ask_user?("Do you mind if I call you #{first_initial} (yes or no)?")
    if answer
        puts "Okay, I will not call you that."
        user[:nickname] = user[:name]
    else
        puts "Cool, From now on I will call you #{first_initial}!"
        user[:nickname] = first_initial
    end
end

def print_age_based_message(user)
    if user[:age] < 13
        puts "You are not yet a teenager"
    else
        puts "You are a teenager" unless user[:age] > 19
        puts "You can legally drink!" if user[:age] >= 21
    end
    years = 75 - user[:age]
    puts "You will be 75 years old in #{years} years."
end

def do_grocery_shopping
    puts "== Let's go grocery shopping! =="
    groceries = ['milk', 'eggs', 'bacon', 'coffee', 'grits']
    puts "Here is your grocery list: #{groceries.join(', ')}"
    while groceries.length > 0
        random_item = groceries.sample
        answer = ask_user?("Did you grab the #{random_item} (yes or no)? ")
        if answer
            groceries.delete(random_item)
        end
        puts "Now your grocery list is #{groceries.join(', ')}"
    end
end

def print_farewell(user)
    puts "Farewell #{user[:nickname]}!"
end

print_greeting
the_user = get_user_info
print_friendly_greeting(the_user)
ask_user_about_nickname(the_user)
print_age_based_message(the_user)
do_grocery_shopping
print_farewell(the_user)