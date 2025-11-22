class ChatController < ApplicationController
  before_action :authenticate_user!

  # Chat room - displays messages with a specific user
  def room
    @other_user = User.find(params[:user_id])
    @messages = Message.where(
      "(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)",
      current_user.id, @other_user.id,
      @other_user.id, current_user.id
    ).order(:created_at)

    # Mark messages as read
    Message.where(receiver_id: current_user.id, sender_id: @other_user.id).update_all(read_at: Time.current)
  end

  # List all users for chat
  def contacts
    @contacts = current_user.get_chat_contacts.order(:email)
  end

  # Get online users
  def online_users
    # In a real implementation, you'd track online status via ActionCable
    # For now, return all users except current user
    @online_users = User.where.not(id: current_user.id).limit(50)
    render json: @online_users.map { |u| { id: u.id, email: u.email } }
  end
end
