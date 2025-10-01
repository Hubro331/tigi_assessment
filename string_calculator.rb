  class StringCalculator

    def initialize(string)
      @values = parse_string(string)
    end

    def calculate
      @values.filter { |value| value < 1000 }.sum
    end

    private

    def parse_string(string)
      string.split(/\n|,/).map(&:to_i)
    end

  end