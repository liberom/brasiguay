require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  setup do
    @sender = users(:one)
    @receiver = users(:two)
  end

  test 'message belongs to sender and receiver' do
    message = Message.create!(
      sender: @sender,
      receiver: @receiver,
      content: 'Hello!'
    )

    assert_equal @sender, message.sender
    assert_equal @receiver, message.receiver
  end

  test 'message has rich text content' do
    message = Message.create!(
      sender: @sender,
      receiver: @receiver,
      content: '<strong>Bold</strong> message'
    )

    assert message.content.body.present?
  end

  test 'message can be marked as read' do
    message = Message.create!(
      sender: @sender,
      receiver: @receiver,
      content: 'Test'
    )

    assert_nil message.read_at
    message.update(read_at: Time.current)
    assert message.read_at.present?
  end

  test 'find unread messages for user' do
    message1 = Message.create!(sender: @sender, receiver: @receiver, content: 'Msg 1')
    message2 = Message.create!(sender: @sender, receiver: @receiver, content: 'Msg 2')

    unread = Message.where(receiver_id: @receiver.id, read_at: nil)
    assert_equal 2, unread.count

    message1.update(read_at: Time.current)
    assert_equal 1, unread.count
  end
end
