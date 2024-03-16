class Profile < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_one :image, as: :imageable
  accepts_nested_attributes_for :image

  enum currency: {
    dollar: 0,
    real: 1,
    guarany: 2
  }

  enum language: {
    pt: 0,
    es: 1
  }
end
