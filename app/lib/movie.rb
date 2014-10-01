require 'csv'
require 'pry'

class Movie
  def self.dudes_favorite_movie
    puts "I know your favorite movie is The Big Lebowski so I won't even ask! \n\n"
  end

  def self.read_csv(csv_file)
    col_data = []
    csv = CSV.foreach(csv_file) do |row| 
      col_data << row[0] + "  " + row[1]
    end
    puts "Here is the author's ranking of movies:\n\n"
    puts col_data
   end
end