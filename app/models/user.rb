class User < ApplicationRecord
  has_secure_password

  has_many :submitted_orders, foreign_key: "customer_id", class_name: "Order"
  has_many :queue_orders, foreign_key: "bartender_id", class_name: "Order"

  has_many :submitted_drinks, through: :submitted_orders, source: :drinks
  has_many :queue_drinks, through: :queue_orders, source: :drinks
end
