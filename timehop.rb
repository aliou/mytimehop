require 'date'
require_relative 'url'
require_relative 'mail'
require_relative 'database'

def get_tweets
  today = (DateTime.now.to_date - 365).strftime('%s').to_i
  tomorrow = today + 3600 * 24
  query = DB.fetch("Select * from tweets
  where date >= #{today} AND date < #{tomorrow}")

  tweets = query.to_a.sort { |a,b| a[:date] <=> b[:date] }
  tweets.each { |tw| link_resolve(tw[:text]) }
  tweets
end
