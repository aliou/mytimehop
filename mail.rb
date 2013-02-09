require 'gmail'
require 'date'

def send_mail(tweets)
  str = ""
  tweets.each do |tw|
    str += "#{tw[:text]}<br /><small>#{tw[:created_at]}</small><br /><br />"
  end
  Gmail.connect(ENV["bot_mail"], ENV["bot_passwd"]) do |gmail|
    gmail.deliver do
      to ENV["my_mail"]
      subject "Your tweets on #{(DateTime.now.to_date - 366).to_s}."
      html_part do
	content_type 'text/html; charset=UTF-8'
	body str
      end
    end
  end
end
