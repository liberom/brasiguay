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
  has_many :messages, foreign_key: 'sender_id', dependent: :destroy
  has_many :events
  has_many :estates
  has_many :products
  has_many :services
  has_many :jobs

  # Chat helpers
  def get_chat_contacts
    User.where(id: Message.where("sender_id = ? OR receiver_id = ?", id, id).pluck(:sender_id, :receiver_id).flatten.uniq - [id])
  end

  def unread_message_count
    Message.where(receiver_id: id, read_at: nil).count
  end
end
