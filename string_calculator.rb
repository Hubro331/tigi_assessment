  class StringCalculator

    class NegativeNumberError < StandardError; end

    BASE_REGEX = "\n|,"

    def initialize(string)
      @values = parse_string(string)
    end

    def calculate
      neg_numbers =  @values.select { |v| v < 0}
        
      if neg_numbers.count > 0
        raise NegativeNumberError.new("negatives not allowed #{neg_numbers}")
      end

      @values.filter { |value| value < 1000 }.sum
    end

    private

    def parse_string(string)
      regex_str = BASE_REGEX
      if string.match?(/\/\//)
        delimiters = string.split("\n")
        regex_str =  regex_str + "|" + delimiters[0].scan(/\/\/(.)/).flatten[0]
        string = delimiters[1..-1].join("\n")
      end

      regex = Regexp.new(regex_str)
      string.split(Regexp.new(regex)).map(&:to_i)
    end

  end