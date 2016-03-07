class Product < ActiveRecord::Base
    mount_uploader :image, ImageUploader
    
    validates_presence_of :name, :price
    validates_numericality_of :price
    
    belongs_to :category
    has_many :product_ingredients
    has_many :recipes

  def self.search(query)
  # where(:title, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%")
  end

end
