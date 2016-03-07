class Foodtype < ActiveRecord::Base
    
    has_many :ingredients
end
