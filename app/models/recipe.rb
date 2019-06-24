class Recipe < ApplicationRecord
  enum list: {cocktails: 0, beers: 1, hard_liquors: 2}
end
