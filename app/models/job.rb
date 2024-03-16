class Job < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :scores, as: :scorable
  has_one :location, as: :locatable
  has_one :favorite, as: :favorable
  has_rich_text :description

  enum modality: {
    remote: 0,
    on_site: 1,
    hybrid: 2
  }

  # enum status: {
  #   open: 0,
  #   closed: 1,
  #   cancelled: 2
  # }
end
