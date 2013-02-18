require 'date'
require_relative 'url'
require_relative 'mail'
require_relative 'database'

@today = (DateTime.now.to_date - 366).strftime('%s').to_i
@omorrow = @today + 3600 * 24

def get_tweets
  query = DB.fetch("SELECT * FROM tweets
  WHERE date >= #{@today} AND date < #{@tomorrow}")

  tweets = query.to_a.sort { |a,b| a[:date] <=> b[:date] }
  tweets.each { |tw| link_resolve(tw[:text]) }
  tweets
end

def get_instagram
  query = DB.fetch("SELECT * FROM instagram
  where date >= #{@today} AND date < #{@tomorrow}")

  picts = query.to_a.sort { |a,b| a[:date] <=> b[:date] }
end
