require 'test_helper'

class ChatChannelTest < ActionCable::Channel::TestCase
  test 'subscribes and streams from chat channel' do
    subscribe
    assert subscription.confirmed?
    assert_has_stream "chat_global"
  end

  test 'rejects subscription without user' do
    stub_connection(current_user: nil)
    assert_reject_subscription
  end

  test 'sends message to receiver' do
    sender = users(:one)
    receiver = users(:two)
    subscribe(current_user: sender)

    perform :send_message, {
      message: 'Hello!',
      receiver_id: receiver.id
    }

    assert_broadcast_on "chat_#{receiver.id}", type: 'message'
  end
end
