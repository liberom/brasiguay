class Learning < ApplicationRecord
  belongs_to :profile, class_name: 'Profile', foreign_key: 'profile_id'
end
