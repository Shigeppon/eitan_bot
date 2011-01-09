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

word_xml = Document.new File.new("word.xml")
#words = ["smash","sneeze","struggle","stupid","substance"]
#words = word_xml.elements.each('/root/word'){|element| puts element.text}
words = Array.new(0)
word_xml.elements.each('/root/word'){|element| words.push(element.text)}

word = words[rand(words.size)]
tweet = "#{word}\n\nhttp://ejje.weblio.jp/content/#{word}" 

t.update tweet

#p Marshal.dump(t)
