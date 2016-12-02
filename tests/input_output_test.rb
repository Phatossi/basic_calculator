require 'minitest/autorun'
require_relative File.join("..", "input_output.rb")

describe "InputOutput" do

  before do
    @input_output = InputOutput.new
  end

  it "should add 3 and 4 and return 7" do
    @input_output.perform_action(3, "+", 4).must_equal(7)
  end

  it "should subtract 3 and 4 and return -1" do
    @input_output.perform_action(3, "-", 4).must_equal(-1)
  end

  it "should multiply 3 and 4 and return 12" do
    @input_output.perform_action(3, "*", 4).must_equal(12)
  end

  it "should divide 3 and 4 and return 0.75" do
    @input_output.perform_action(3, "\\", 4).must_equal(0.75)
  end



end

