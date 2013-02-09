namespace :db do
  require_relative 'database'
  desc "Imports the initial tweets from the JSON files."
  task :import do
    puts "Import from twitter or json files."
  end
end

namespace :mail do
  require_relative 'timehop'
  require_relative 'mail.rb'
  desc "Sends a TimeHop mail."
  task :send do
    tw = get_tweets
    send_mail(tw) unless tw.nil? or tw.empty?
  end
end
