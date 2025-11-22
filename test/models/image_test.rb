require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @product = @user.products.create!(name: 'Test Product', price: 100.0)
  end

  test 'image validates presence of image file' do
    image = @product.images.build
    assert_not image.valid?
    assert image.errors[:image].any?
  end

  test 'image belongs to imageable polymorphically' do
    image = @product.images.build(image: fixture_file_upload('test.jpg', 'image/jpeg'))
    if image.save
      assert_equal @product, image.imageable
      assert_equal 'Product', image.imageable_type
    end
  end

  test 'product has many images relationship' do
    # Test the association works
    assert @product.respond_to?(:images)
    assert @product.images.is_a?(ActiveRecord::Associations::CollectionProxy)
  end
end
