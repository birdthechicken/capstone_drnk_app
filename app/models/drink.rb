class Drink < ApplicationRecord
  belongs_to :order
  has_one :customer, through: :order
  belongs_to :recipe

  enum status: {pending: 0, completed: 1}
 
end
