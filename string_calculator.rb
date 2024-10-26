class StringCalculator

  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    numbers = parse_delimiter_for_numbers(numbers)

    # Split the numbers by the defined delimiter
    number_array = numbers.split(delimiter).map(&:to_i)

    return 0 if number_array.empty?

    # Check for negative numbers
    negatives = number_array.select { |num| num < 0 }
    raise "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

    number_array.sum
  end

  def self.parse_delimiter_for_numbers(numbers)
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = parts[0][2..-1]  # Extract the delimiter
      numbers = parts[1]
      numbers.gsub!(delimiter, ',') # Replace custom delimiter with comma
    end
    numbers
  end
end

# Example Usage
puts StringCalculator.add("1,5")
