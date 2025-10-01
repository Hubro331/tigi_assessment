require "minitest/autorun"
require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def test_empty_string
    assert_equal 0, StringCalculator.new('').calculate
  end

  def test_single_number
    assert_equal 1, StringCalculator.new('1').calculate
  end

  def test_two_numbers
    assert_equal 3, StringCalculator.new('1,2').calculate
  end
   
  def test_number_strating_with_empty_string
    assert_equal 5, StringCalculator.new('"",2,3').calculate
  end

end