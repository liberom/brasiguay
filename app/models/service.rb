class Service < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_rich_text :description
  has_one :favorite, as: :favorable
  has_many :scores, as: :scorable
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images
end
