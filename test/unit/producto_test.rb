require 'test_helper'

class ProductoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "product attributes must not be empty" do
	producto = Producto.new
	assert producto.invalid?
	assert producto.errors[:nombre].any?
	assert producto.errors[:codigo].any?
	assert producto.errors[:precio].any?
	assert producto.errors[:imageUrl].any?
	assert producto.errors[:marca].any?
	assert producto.errors[:cantidad].any?
	assert producto.errors[:modelo].any?
	end
end
