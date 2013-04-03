require 'pry'
require 'sqlite3'

class Movie
  attr_accessor :title
  attr_accessor :rated
  attr_accessor :year
  attr_accessor :director

  # Add attr_accessors for the values you want to store...
  def self.db
    @@db
  end
  @@db = SQLite3::Database.new("test/test.db")

  def self.get_film_info(name)    
    imdb_data = HTTParty.get("http://www.omdbapi.com/?t=#{name}")
    movie_info = JSON(imdb_data)
  
    movie_collection = []
    # Create a Movie object...
    movie = Movie.new

    movie.title = movie_info["Title"]
    movie.rated = movie_info["Rated"]
    movie.year = movie_info["Year"]
    movie.director = movie_info["Director"]
    movie.actors = movie_info["Actors"].split(",")

    movie_collection << movie
    movie
    sql = "insert into movies (name, year, director, rated) values (?, ?, ?, ?)"
    # Execute the SQL and provide the actual values
    
    @@db.execute(sql, movie.title, movie.year, movie.director, movie.rated)
    binding.pry

    # Store me in a SQLite3 database...
   
  end

end
