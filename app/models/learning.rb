class Learning < ApplicationRecord
  belongs_to :profile, class_name: 'Profile', foreign_key: 'profile_id'
  belongs_to :user, through: :profile
end
