class Location < ApplicationRecord
  belongs_to :locatable, polymorphic: true
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
end
