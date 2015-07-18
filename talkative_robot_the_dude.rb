require 'csv'
require 'pry'
require './person'
require './user'
require './author'
require './movie'
require './grocery_list'

user_info = User.get_user_info
@current_user = User.new(user_info)

@current_user.surname
@current_user.person_compared_to_age_75
@current_user.print_age_compared_to_author
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

@current_user.recreation_question

Movie.dudes_favorite_movie
Movie.read_csv("movie_rankings.csv")

@current_user.farewell_to_user

people = [user_info, author_info]

@current_user.select_by_name(people, user_info[:full_name])

author_info = Author.author_hash
@author_me = Author.new(author_info)
@author_me.author_info(author_info, people)





puts "Hey Mr. Roboto"







