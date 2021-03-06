# -*- coding: utf-8 -*-
require 'rubygems'
require 'yajl/http_stream'
require 'mongo'

unless keyword = ARGV[0]
  puts "\nUsage: ruby #{$0} KEYWORD\n\n"
  exit(0)
end

db = Mongo::Connection.new("localhost", 27017).db("twitter")
coll = db.collection(keyword)

hash = Yajl::HttpStream.get("http://search.twitter.com/search.json?&lang=en&rpp=100&q=#{keyword}")
coll.insert(hash["results"])

puts "Liczba rekordów zapisanych w bazie 'twitter' w kolekcji '#{keyword}': #{coll.count()}"
