class Order < ApplicationRecord
  belongs_to :customer, class_name: "User"
  belongs_to :bartender, class_name: "User"

  has_many :drinks

  enum status: {ordering: 0, in_process: 1, mixing: 2, completed: 3 }
end
