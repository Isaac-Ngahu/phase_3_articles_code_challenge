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