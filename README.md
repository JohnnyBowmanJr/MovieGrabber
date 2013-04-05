# Movies Homework

We're going to make a Sinatra web application that will act as an online film search engine.

# Install

1. Fork this repo
2. git clone your own copy as normal.
3. Add a remote called dmgarland
```git remote add dmgarland https://github.com/dmgarland/MovieGrabber.git```
4. cd into your project folder
```cd ~/projects/MovieGrabber```
5. Fetch down my changes
```git fetch dmgarland```
6. Create a remote tracking branch for my sinatra_flava branch
```git branch --track sinatra_flava dmgarland/sinatra_flava```
7. Make sure you are on the right branch
```git checkout sinatra_flava```
8. Install the following gems:
```gem install httparty```
```gem install json```
```gem install rack-flash3```
9. Run the server:
```ruby movie_server.rb```

You should see Sinatra running on port 4567.

# TODO

* Add code to the views/layout.erb so that we have a valid HTML website.
  * I want a header, with your website title and a search box.
  * I want a welcome page, so that when I visit '/' I see a nice welcome message and some instructions on how to use the application.
  * I want to type the name of a film into the search box, and when I press 'Search', I see a picture of the film, and information about the Movie.
* Protect all the URLs in your application with a 'private beta' landing page. Only let through users if they type the password 'coolbananas', whereupon they can use the site without having to type their password again.
* If a user types the wrong password, show a flash message that informs them to follow the IMDB twitter account if they are interested in joining
* If a user types the right password, show a flash message welcoming them to the application.
* Add HTML / CSS to make your website look pretty. 

# DEPLOYMENT

* Login to Heroku by typing:

```
    heroku login
```

* Create an app on Heroku using:

```
    heroku create
```

* Make a note of the URL it gives you. Will be something like 
http://cool-bananas-922.herokuapp.com. 
* Push the example app from your cloned repository to your heroku repository:

```
    git push heroku master
```    
* Cut+paste your heroku URL into your favourite web browser. You should see 
the example app.  

* Then its burritos and beer time!

# EXTENSIONS

* Change the application so that it validates that I type in the name of a film
* Change the application so that it works if the IMDB is down, or doesn't find the film, whereupon we send a 404 not found
* Change the application so that we persist the information to a SQLite3 database. If the search is found in the local database, we want to use that information, instead of making unnecessary calls to IMDB.
* When you're done, send me a pull request