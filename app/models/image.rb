class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :imageable, polymorphic: true
  # belongs_to :estate
  # belongs_to :event
  # belongs_to :product
  # belongs_to :service
  # belongs_to :profile

  validates :image, presence: true
  validate :image_size_validation

  private

  def image_size_validation
    if image.size > 10.megabytes
      errors.add(:image, 'file size must be less than 10MB')
    end
  end
end
