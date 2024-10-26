# spec/your_code_spec.rb
require 'spec_helper'
require_relative '../string_calculator'

# string_calculator_spec.rb
require './string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns the number for a single number' do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it 'returns the sum for two comma-separated numbers' do
      expect(StringCalculator.add("1,5")).to eq(6)
    end

    it 'returns the sum for numbers with new lines' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'supports custom delimiters' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
      expect(StringCalculator.add("//|\n1|2|3")).to eq(6)
    end

    it 'raises an error for negative numbers' do
      expect { StringCalculator.add("-1") }.to raise_error("negative numbers not allowed: -1")
      expect { StringCalculator.add("1,-2,3,-4") }.to raise_error("negative numbers not allowed: -2, -4")
    end

    it 'handles multiple numbers and mixed delimiters' do
      expect(StringCalculator.add("//;\n1;2\n3,4")).to eq(10)
      expect(StringCalculator.add("//-\n1-2-3,4")).to eq(10)
    end

  end
end

