require 'rubygems'
require 'twitter_oauth'

t = TwitterOAuth::Client.new({
  :consumer_key=>"AnBK0IZHO8Fwjyb18IslA",
  :consumer_secret=>"5mwVXuKMBaDuLX6AI98BDhtd35Eqgv3CUTe4tSQhoc4",
  :token=>"235550669-TFN1sfj8EQKoqQOoZbts8pRHZwoWtjrjbAid9z6C",
  :secret=>"meu8R8jKJlOiVBINTBciSpHJmY0svllHcwGx4b0n7g"
})

words = ["smash","sneeze","struggle","stupid","substance"]

t.update words[rand(words.size)] + ":rand=>#{rand(1000)}"

#p Marshal.dump(t)
