require 'date'
require_relative 'database'
require_relative 'mail'

@today = (DateTime.now.to_date - 366).strftime('%s').to_i
@omorrow = @today + 3600 * 24

def get_tweets
  tweets = DB.fetch("SELECT * FROM tweets
  WHERE date >= #{@today} AND date < #{@tomorrow}")

  tweets.to_a
end

def get_instagram
  query = DB.fetch("SELECT * FROM instagram
  where date >= #{@today} AND date < #{@tomorrow}")

  picts = query.to_a
end
