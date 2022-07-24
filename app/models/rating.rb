class Rating < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :user_id, presence: { message: "User ID must be present" }
  validates :recipe_id, presence: { message: "Recipe ID must be present" }
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
