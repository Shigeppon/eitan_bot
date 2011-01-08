require 'rubygems'
require 'twitter_oauth'
require 'rexml/document'

include REXML

doc = Document.new File.new("secret.xml")

consumer_key = doc.elements['/root/consumer_key'].text
consumer_secret = doc.elements['/root/consumer_secret'].text
token = doc.elements['/root/token'].text
secret = doc.elements['/root/secret'].text

t = TwitterOAuth::Client.new({
  :consumer_key=>consumer_key,
  :consumer_secret=>consumer_secret,
  :token=>token,
  :secret=>secret
})

words = ["smash","sneeze","struggle","stupid","substance"]

t.update words[rand(words.size)] + ":rand=>#{rand(1000)}"

#p Marshal.dump(t)
