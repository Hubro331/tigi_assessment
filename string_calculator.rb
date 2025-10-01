  class StringCalculator

    class NegativeNumberError < StandardError; end

    BASE_DELEMITERS = ["\n",","]

    def initialize(string)
      @values = parse_string(string)
    end

    def calculate
      neg_numbers =  @values.select { |v| v < 0}
        
      if neg_numbers.count > 0
        raise NegativeNumberError.new("negatives not allowed #{neg_numbers}")
      end

      @values.filter { |value| value <= 1000 }.sum
    end

    private

    def parse_string(string)
      delimiters = BASE_DELEMITERS
      
      if string.match?(/\/\/\[/)
        lines = string.split("\n")
        delimiters =  delimiters  +  lines[0].scan(/\[(.*?)\]/).flatten
        string = lines[1..-1].join("\n")
      elsif string.match?(/\/\//)
        lines = string.split("\n")
        delimiters =  delimiters + lines[0].scan(/\/\/(.)/).flatten
        string = lines[1..-1].join("\n")
      end

      str_regex = delimiters.map  { |d| Regexp.escape(d) }.join("|")
      regex = Regexp.new(str_regex)
      string.split(regex).map(&:to_i)
    end

  end