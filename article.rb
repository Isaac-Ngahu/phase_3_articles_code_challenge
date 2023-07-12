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