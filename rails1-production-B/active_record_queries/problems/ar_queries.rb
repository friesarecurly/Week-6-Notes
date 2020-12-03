# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer

# IMPORTANT:
# For all of the following problems return an ActiveRecord::Association unless
# otherwise specified. 

def god_father_movies
  # Find the id, title and year of each Godfather movie
  Movie
    .select(:id, :title, :yr)
    .where("title LIKE '%Godfather%'")
end

def michelle_movies
  # Find the id, title, and year of movies Michelle Pfeiffer has acted in.
  # Order them by score (descending) and title (descending).
  Movie
    .select(:id, :title, :yr)
    .joins(:actors)
    .where(actors: {name: 'Michelle Pfeiffer'})
    .order('score DESC')
    .order('title DESC')
end

def actor_ids_from_blade_runner
  # Return an array (NOT an ActiveRecord:Association) of the `ids` of 
  # all the actors that were in the movie "Blade Runner"
  Actor
    .joins(:movies)
    .where(movies: {title: 'Blade Runner'})
    .pluck(:id)
end

def best_years
  # Return an array of the years (NOT an ActiveRecord:Association) 
  # in which every movie released had a minimum rating of 8 or above.
  below = Movie.select(:yr).where('score < 8')
  Movie
    .where.not(yr: below)
    .group(:yr)
    .pluck(:yr)
end
# SELECT yr
# FROM movie
# WHERE SCORE >= 8
# GROUP BY yr


def harrying_times
  # Return an array of the year(s) (NOT an ActiveRecord:Association) in which
  # Harrison Ford made at least 2 movies. 

  Movie
    .joins(:actors)
    .where(actors: {name: 'Harrison Ford'})
    .group(:yr)
    .having("COUNT(actor_id) >= 2")
    .pluck(:yr)

end
  # Movie.joins(:actors).where(actors: {name: 'Harrison Ford'})