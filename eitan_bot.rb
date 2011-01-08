require 'rubygems'
require 'twitter_oauth'

t = TwitterOAuth::Client.new({
  :consumer_key=>"",
  :consumer_secret=>"",
  :token=>"",
  :secret=>""
})

words = ["smash","sneeze","struggle","stupid","substance"]

t.update words[rand(words.size)] + ":rand=>#{rand(1000)}"

#p Marshal.dump(t)
