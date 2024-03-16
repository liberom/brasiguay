class Product < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :scores, as: :scorable
  has_one :favorite, as: :favorable
  has_rich_text :description
end
