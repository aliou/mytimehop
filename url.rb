require 'net/http'
require 'uri'

def link_wrap(url)
  "<a href=\"#{url}\" >[link]</a>"
end

def link_resolve(tweet)
  tweet.scan( /http:\/\/t\.co\/[a-zA-Z0-9\-]+/ ).each do |url|
    uri = URI.parse url
    Net::HTTP::start( uri.host , uri.port ) do |connection|
      connection.request_get uri.path do |response|
	tweet.gsub! url , link_wrap(response['Location']) unless response['Location'].nil?
      end
    end
  end
  tweet
end
