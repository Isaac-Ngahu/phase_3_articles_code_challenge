require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###
class Article
  attr_reader :author,:magazine,:title
  @@article_instances =[]
  def initialize(author, magazine, title)
      @author = author
      @magazine = magazine
      @title = title
      @@article_instances << self
  end
  def self.all
      @@article_instances
  end
  def author
    @author[:name]
  end
end
first_author = {
  "name":"izoh",
  "age":25,
  "town":"kinangofu"
}
first_magazine = {
  "name":"new york times",
  "category":"wall street economy"
}
title = "The big dip"
second_author = {
  "name":"izoh",
  "age":30,
  "town":"Nanyuki"
}
second_magazine = {
  "name":"The Nairobian",
  "category":"graphic"
}
title2 = "What's really goin on"
third_author = {
  "name":"izoh",
  "age":30,
  "town":"Nanyuki"
}
third_magazine ={
  "name": "The Nairobian",
  "category":"informative",
}
title3 = "the streets"
fourth_author = {
  "name":"izoh",
  "age":30,
  "town":"Nanyuki"
}
fourth_magazine = {
  "name":"The Nairobian",
  "category":"invigorating"
}
title4 = "celebrities"

new_article = Article.new(first_author,first_magazine,title)
second_article = Article.new(second_author,second_magazine,title2)
third_article = Article.new(third_author,third_magazine,title3)
fourth_article = Article.new(fourth_author,fourth_magazine,title4)
new_author = Author.new("izoh")
new_magazine = Magazine.new("The Nairobian","graphic")



### DO NOT REMOVE THIS
binding.pry

0


