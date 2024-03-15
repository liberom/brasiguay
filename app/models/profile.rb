class Profile < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

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
