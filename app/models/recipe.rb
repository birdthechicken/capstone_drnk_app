class Recipe < ApplicationRecord
  has_many :drinks
  enum list: {cocktails: 0, beers: 1, hard_liquors: 2}

  def comment_messages
    drinks.pluck(:comment).reject(&:blank?)
  end

  def given_ratings
    
    drinks.average_ratings
    # drinks.pluck(:rating).reject(&:blank?)
  end 
end
