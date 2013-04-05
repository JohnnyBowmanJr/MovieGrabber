require 'httparty'
require 'json'
require 'pry'

class Movie

  # Add attr_accessors for the values you want to store...
  attr_accessor :title, :year, :rating, :genre, :director, :actors, :plot, :poster_url

  def self.get_film_info(name)    
    imdb_data = HTTParty.get("http://www.omdbapi.com/?t=#{name}")
    movie_info = JSON(imdb_data)
    
    # Create a Movie object...
    m = Movie.new
    m.title = movie_info["Title"]
    m.year = movie_info["Year"]
    m.rating = movie_info["Rating"]
    m.genre = movie_info["Genre"]
    m.director = movie_info["Director"]
    m.actors = movie_info["Actors"]
    m.plot = movie_info["Plot"]
    m.poster_url = movie_info["Poster"]
    m
  end

  def self.get_film_from_db_info(db_film)
    movie = Movie.new
    movie.title = db_film[0]
    movie.year = db_film[1]
    movie.rating = db_film[2]
    movie.genre = db_film[3]
    movie.director = db_film[4]
    movie.actors = db_film[5]
    movie.plot = db_film[6]
    movie.poster_url = db_film[7]
    movie
  end
  
  def save
    db = SQLite3::Database.new("movies.db")
    sql = "insert into movies (title, year, rating, genre, director, actors, 
      plot, poster_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"

    db.execute(sql, title, year, rating, genre, director, actors, plot, poster_url)
  end

end