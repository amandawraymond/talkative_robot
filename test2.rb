
grocery_list = IO.read("grocery_list.txt").chomp.split(", ")
grocery_list.map! {|item| item.downcase}
IO.write("new_grocery_list.txt", grocery_list)