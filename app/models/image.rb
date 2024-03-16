class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :estate
  belongs_to :event
  belongs_to :product
  belongs_to :service
  belongs_to :profile
end
