namespace :db do
  require_relative 'database'
  desc "Imports the initial tweets from the JSON files."
  task :import do
    initial_import
  end
end

namespace :mail do
  require_relative 'timehop'
  require_relative 'mail'
  desc "Sends a TimeHop mail."
  task :send do
    tw = get_tweets
    send_mail(tw) unless tw.nil? or tw.empty?
  end
end
