require 'minitest/autorun'
require_relative File.join("..", "math_utils.rb")

describe "MathUtils" do

  it "returns the result of 1 + 2 + 3 + 4" do
    MathUtils.add_array_elements([1,2,3,4]).must_equal(10)
  end

  it "returns the result of 4-3-2-1" do
    MathUtils.subtract_array_elements([4,3,2,1]).must_equal(-2)
  end

  it "returns the result of 1 * 2 * 3 * 4" do
    MathUtils.multiply_array_elements([1,2,3,4]).must_equal(24)
  end

  it "returns the result of 24/3/2/2" do
    MathUtils.divide_array_elements([24,3,2,2]).must_equal(2.0)
  end

  it "returns 7 when adding 3 and 4" do
    MathUtils.add(3, 4).must_equal(7)
  end

  it "returns 21 when adding 1, 2, 3, 4, 5 and 6" do
    MathUtils.add(1, 2+3+4+5+6).must_equal(21)
  end

  it "returns 8 when subtracting 10 and 2" do
    MathUtils.subtract(10, 2).must_equal(8)
  end

  it "returns 16 when subtracting 10, 2, 8 and 4" do
    MathUtils.subtract(10, -2-8-4).must_equal(-4)
  end

  it "returns 33 when multiplying 3 and 11" do
    MathUtils.multiply(11, 3).must_equal(33)
  end

  it "returns 66 when multiplying 3 and 2" do
    MathUtils.multiply(11, *2*3).must_equal(66)
  end

  it "returns 42 when dividing 84 and 2" do
    MathUtils.divide(84, 2).must_equal(42)
  end

  it "returns Infinity when dividing 4 and 0" do
    MathUtils.divide(4, 0).must_equal(4.0 / 0)
  end

end