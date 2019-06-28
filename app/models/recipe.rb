class Recipe < ApplicationRecord
  has_many :drinks
  enum list: {cocktails: 0, beers: 1, hard_liquors: 2}

  def comment_messages
    drinks.pluck(:comment).reject(&:blank?)
  end

  def average_rating

    drinks.average(:rating)
    # drinks.pluck(:rating).reject(&:blank?)
  end 
end
