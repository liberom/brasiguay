class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
  has_one :account
  has_many :learnings, through: :profile
  has_many :experiences, through: :profile
  has_many :articles
  has_many :favorites, through: [:articles] # , :events, :products, :services, :estates
  has_many :scores, through: [:articles]
  has_many :locations
  has_many :feedbacks
  has_many :friendships
  has_many :favorites
  has_many :messages
  has_many :events
  has_many :estates
  has_many :products
  has_many :services
  has_many :jobs
end
