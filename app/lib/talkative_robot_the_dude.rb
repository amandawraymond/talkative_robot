require 'csv'
require 'pry'
require './person'
require './user'
require './author'
require './movie'
require './grocery_list'

user_info = User.get_person_info
@current_user = User.new(user_info)

@current_user.surname_message
@current_user.person_compared_to_age_75
puts @current_user.print_age_compared_to_author
puts @current_user.print_age_appropriate_sentence
@current_user.nickname_question
puts @current_user.nickname_sentence
puts @current_user.more_questions_statement

@our_grocery_list = GroceryList.new(@current_user)
@our_grocery_list.remind_me
@our_grocery_list.print_grocery_list("grocery_list.txt")
@our_grocery_list.delete_random_item
@our_grocery_list.need_to_add_drink(@nickname)
@our_grocery_list.write_to_file("grocery_list_2.txt")
@our_grocery_list.headered_csv_grocery_list("grocery_list_headered.csv")
@our_grocery_list.print_grocery_list("grocery_list_headered.csv")

@current_user.recreation_question

Movie.dudes_favorite_movie
Movie.read_csv("movie_rankings.csv")

@current_user.farewell_to_user

author_info = Author.author_hash
@author_me = Author.new(author_info)

people = [user_info, author_info]

@current_user.select_by_name(people, user_info[:full_name])
@author_me.author_info(author_info, people)

















