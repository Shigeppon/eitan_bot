require 'rubygems'
require 'twitter_oauth'
require 'rexml/document'

include REXML

doc = Document.new File.new(File.dirname(__FILE__) + "/public/secrets/secret.xml")

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

word_xml = Document.new File.new(File.dirname(__FILE__) + "/word.xml")

words = Array.new(0)
word_xml.elements.each('/root/word') do |element|
  examples = Array.new(0)
  name = element.attributes["name"]
  element.elements.each('example'){|element| examples.push([element.text])}
  words.push([name,examples])
end

index = rand(words.size)
word = words[index]

eg = "#{word[1].join("|")}"
eg = "e.g. "+ eg if eg.length > 0

tweet = "[#{word[0]}] #{eg} http://ejje.weblio.jp/content/#{word[0]}" 

t.update tweet

#p Marshal.dump(t)
