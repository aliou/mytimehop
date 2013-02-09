require 'sequel'
require 'date'
require 'oj'
require 'twitter'

DB = Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/mytimehop')

def initial_import_json
  tweets = []
  Dir['tmp/tweets/*.json'].each do |file|
    tweet = Oj.load_file file
    tweet["date"] = Time.parse(tweet["created_at"]).to_i
    tweets << tweet
  end

  create_tables
  tweets.each do |tw|
    insert_new_row tw
  end
end

def initial_import_tw
end

def create_tables
  DB.create_table? :tweets do
    primary_key :id
    String :text
    String :created_at
    Integer :date
  end
end

def insert_new_row(row)
  tweets = DB[:tweets]

  tweets.insert(:text	     => row["text"],
		:created_at  => row["created_at"],
		:date	     => row["date"])
end
