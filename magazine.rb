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
