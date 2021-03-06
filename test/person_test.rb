require 'test/unit'
require 'sqlite3'
require 'httparty'
require 'json'
require 'pry'
require_relative '../movies'

class MovieGrabberTest < Test::Unit::TestCase

  def setup
    @@db = SQLite3::Database.new("test/test.db")
  end

  def test_get_film_info_method
    movie = Movie.get_film_info("jaws")
    assert_equal "Jaws", movie.title
    # Don't forget to create your movies table first, using sqlite3...
    movies = @@db.execute("select * from movies")
    assert_equal 1, movies.length 
    #movies.length.should == 1
    
    #movies.first[1].should == "Jaws" 
    assert_equal "Jaws", movies.first["Jaws"]
    # Note, this can change if you want/need
    # Add other parts to your test here...
  end

  def teardown
    @@db.close
  end
end