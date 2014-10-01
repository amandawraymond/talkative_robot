require 'csv'
require 'pry'
require './person'

class GroceryList
  def initialize(user)
    gets_grocery_list
    gets_drink
    produce_random_item
  end

  def gets_grocery_list
    puts "I am going to the grocery store. What text file do you want me to pull in as our grocery_list?"
    text_file = gets.chomp.to_s
    @grocery_list = IO.read(text_file).chomp.split(", ")
  end

  def remind_me
    produce_random_item
    puts "I really really need to buy #{@random_item}, so remind me!\n\n"
  end

  def print_grocery_list(csv_file)
    puts "Here is our updated grocery list so far:\n\n"
    puts IO.read(csv_file)
    puts "\n "
  end

  def delete_random_item
    puts "Wait! Did you already buy some #{@random_item}?\n\n"
    random_item_bought = gets.chomp.downcase
    random_item_bought_short = random_item_bought.chars.first
    @grocery_list.delete(@random_item) if random_item_bought_short == "y"
  end

  def gets_drink
    puts "What is your favorite drink?"
    @drink = gets.chomp
  end

  def need_to_add_drink(nickname)
    puts "Keeping it classy #{nickname} i seeeee..well I dont have any #{@drink} here. But I'll add it to our grocery list!\n\n"
    puts "Okay! sounds good, I will try not to forget your #{@drink}.\n\n"
    @grocery_list.unshift(@drink)
  end

  def write_to_file(txt_file)
    IO.write(txt_file, @grocery_list.join(", "))
  end
  
  def headered_csv_grocery_list(csv_file)
    CSV.open(csv_file, "w") do |csv|
        csv << ["Item Number", "Item Name"]
          @grocery_list.each_index do |i| 
        csv << [ i+1, @grocery_list[i]] 
          end
    end
  end

    def produce_random_item
      @random_item ||= @grocery_list.sample
    end
end