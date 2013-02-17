require 'date'
require_relative 'database'
require_relative 'mail'

def get_tweets
  res = []
  today = (DateTime.now.to_date - 366).strftime('%s').to_i
  tomorrow = today + 3600 * 24
  query = DB.fetch("Select * from tweets
  where date >= #{today} AND date < #{tomorrow}")

  tweets = query.to_a.sort { |a,b| a[:date] <=> b[:date] }
  tweets
end
