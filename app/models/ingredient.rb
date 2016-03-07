class Ingredient < ActiveRecord::Base
    has_many :ingredients
    
    belongs_to :foodtype
    
    def self.search(query)
        # where(:title, query) -> This would return an exact match of the query
        where("name like ?", "%#{query}%")
    end
end
