require 'minitest/autorun'
require_relative '../expression_utils'

describe 'ExpressionUtilsTest' do

  it "should return true when expression has +, -" do
    ExpressionUtils.are_different_operators_present("-3+4").must_equal(true)
  end

  it "should return true when expression has +, *" do
    ExpressionUtils.are_different_operators_present("*3+4").must_equal(true)
  end

  it "should return true when expression has +, //" do
    ExpressionUtils.are_different_operators_present("-3/4").must_equal(true)
  end

  it "should return true when expression has -, *" do
    ExpressionUtils.are_different_operators_present("-3*4").must_equal(true)
  end

  it "should return true when expression has -, //" do
    ExpressionUtils.are_different_operators_present("-3/4").must_equal(true)
  end

  it "should return true when expression has *, //" do
    ExpressionUtils.are_different_operators_present("-3*4/4").must_equal(true)
  end

  it "should return plus string" do
    ExpressionUtils.choose_operation("+").must_equal("plus")
  end

  it "should return subtract string" do
    ExpressionUtils.choose_operation("-").must_equal("minus")
  end

  it "should return multiplied by string" do
    ExpressionUtils.choose_operation("*").must_equal("multiplied by")
  end

  it "should return divided by string" do
    ExpressionUtils.choose_operation("\\").must_equal("divided by")
  end

  it "should extract components 33, 5" do
    ExpressionUtils.extract_components("33+5").must_equal(["33", "5"])
  end

  it "should extract components -13, 3315" do
    ExpressionUtils.extract_components("-13-3315").must_equal(["", -13, "3315"])
  end

  it "should retun + string for + operator" do
    ExpressionUtils.identify_operator("73+53").must_equal("+")
  end

  it "should retun - string for * operator" do
    ExpressionUtils.identify_operator("73-53").must_equal("-")
  end

  it "should retun * string for * operator" do
    ExpressionUtils.identify_operator("73*53").must_equal("*")
  end

  it "should retun \\ string for \\ operator" do
    ExpressionUtils.identify_operator("73\\53").must_equal("\\")
  end

  it "should retun \\ string for // operator" do
    ExpressionUtils.identify_operator("73//53").must_equal("\\")
  end

  it "should return plus string" do
    ExpressionUtils.operator_name("+").must_equal("plus")
  end

  it "should return minus string" do
    ExpressionUtils.operator_name("-").must_equal("minus")
  end

  it "should return times string" do
    ExpressionUtils.operator_name("*").must_equal("times")
  end

  it "should return divided by string" do
    ExpressionUtils.operator_name("//").must_equal("divided by")
  end

  it "should return terms" do
    ExpressionUtils.get_terms("33-31").must_equal(["33", "31"])
  end

  it "should return terms" do
    ExpressionUtils.get_terms("-33-31").must_equal(["", -33, "31"])
  end


  it "should return false for an expression with letters" do
    ExpressionUtils.is_valid_expression?("b-a").must_equal(false)
  end


  it "should return false for a short expression" do
    ExpressionUtils.is_valid_expression?("90-").must_equal(false)
  end

  it "should return false for an invalid operator" do
    ExpressionUtils.is_valid_expression?("331x3").must_equal(false)
  end

  it "should return true for a valid expression" do
    ExpressionUtils.is_valid_expression?("331+3").must_equal(true)
  end

  it "should return false when it is not a number" do
    ExpressionUtils.is_number?("a").must_equal(false)
  end
end
