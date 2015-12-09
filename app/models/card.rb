class Card < ActiveRecord::Base
	validates :recipe_name, presence: true, length: { minimum: 5 }
end
