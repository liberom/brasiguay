class ChatChannel < ApplicationCable::Channel
  def subscribed
    @user = current_user
    if @user
      stream_from "chat_#{@user.id}"
      stream_from "chat_global"
      broadcast_user_joined
    else
      reject
    end
  end

  def unsubscribed
    broadcast_user_left if current_user
  end

  def send_message(data)
    return unless current_user

    receiver = User.find_by(id: data['receiver_id'])
    return unless receiver

    message = Message.create!(
      sender: current_user,
      receiver: receiver,
      content: data['message']
    )

    # Send to receiver's private chat stream
    ActionCable.server.broadcast(
      "chat_#{receiver.id}",
      type: 'message',
      sender_id: current_user.id,
      sender_name: current_user.email,
      message: data['message'],
      timestamp: message.created_at.strftime('%H:%M')
    )

    # Send to sender's stream for confirmation
    ActionCable.server.broadcast(
      "chat_#{current_user.id}",
      type: 'message_sent',
      receiver_id: receiver.id,
      message: data['message'],
      timestamp: message.created_at.strftime('%H:%M')
    )
  end

  def broadcast_user_joined
    ActionCable.server.broadcast(
      'chat_global',
      type: 'user_joined',
      user_id: @user.id,
      user_name: @user.email
    )
  end

  def broadcast_user_left
    ActionCable.server.broadcast(
      'chat_global',
      type: 'user_left',
      user_id: @user.id,
      user_name: @user.email
    )
  end
end
