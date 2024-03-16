class Estate < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_rich_text :description
  has_one :location, as: :locatable
  has_one :favorite, as: :favorable
  has_many :scores, as: :scorable
  has_many :images
  accepts_nested_attributes_for :images

  enum currency: {
    dollar: 0,
    real: 1,
    guarany: 2
  }

  enum type: {
    house: 0,
    apartment: 1,
    office: 2
  }

  enum modality: {
    rent: 0,
    purchase: 1
  }
end
