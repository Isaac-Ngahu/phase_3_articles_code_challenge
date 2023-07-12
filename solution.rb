# Please copy/paste all three classes into this file to submit your solution!
class Author
    attr_reader :name
  
    def initialize(name)
      @name = name
    end
    def articles
      article_instance = Article.all.select do |single_article|
        single_article.author == self.name
      end
      
    end
    def magazines
      magazine_instances = []
      instances = Article.all.select do |article|
        article.author == self.name
      end
      magazines = instances.each do |instance|
        magazine_instance = instance.magazine
        magazine_instances << magazine_instance
      end
      unique_magazines = magazine_instances.uniq {|magazine| magazine[:name]}
      unique_magazines
    end
    def add_article(magazine,title)
      author_name={
        :name => self.name
      }
      new_article = Article.new(author_name,magazine,title)
      new_article
    end
    def topic_areas
      topics = []
      instances = Article.all.select do |article|
        article.author == self.name
      end
      instances.select do |instance|
        magazine_category = instance.magazine
        topics << magazine_category[:category]
      end
      topics.uniq
    end
  end

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
    
end
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
    
end

class Magazine
    attr_accessor :name, :category
    @@magazine_instances = []
  
    def initialize(name, category)
      @name = name
      @category = category
      @@magazine_instances << self
    end
    def self.all
      @@magazine_instances
    end
    def contributors
      author_contributors = []
      instances = Article.all.select do |article|
        article.magazine[:name] == self.name
      end
      instances.select do |instance|
        author = instance.author
        author_contributors << author
      end
      author_contributors
    end
    def find_by_name(name)
      searched_magazine = @@magazine_instances.find do |magazine|
        magazine.name == name
      end
      searched_magazine
    end
    def article_titles
      titles = []
      instances = Article.all.select do |article|
        article.magazine[:name] == self.name
      end
      instances.each do |instance|
        title = instance.title
        titles << title
      end
      titles
    end
    def contributing_authors
      authors = []
      contributing_author_names = []
      author_contributors = contributors
      instances = Article.all.select do |article|
        article.magazine[:name] == self.name
      end
      names = instances.each do |instance|
        author_name = instance.author
        authors << author_name
      end
      authors.each do |element|
        count = author_contributors.count(element)
        if count > 2
          contributing_author_names << element
        end
      end
      contributing_author_names.uniq
    end
  
  end
  