class Order < ApplicationRecord
  belongs_to :customer, class_name: "User"
  belongs_to :bartender, class_name: "User"

  has_many :drinks, dependent: :destroy

  enum status: {ordering: 0, in_process: 1, mixing: 2, ready:3, completed: 4, picked_up: 5 }
end
