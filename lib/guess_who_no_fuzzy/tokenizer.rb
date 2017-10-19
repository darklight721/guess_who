module GuessWhoNoFuzzy
  class Tokenizer
    def self.tokenize!(str)
      self.new(str).tokenize!
    end

    def initialize(str)
      @str = str
    end

    def tokenize!
      token_arrays = []
      str_size = @str.size

      str_size.times do |i|
        first_slice = i + 1
        first_name = @str.slice(0, first_slice)

        (str_size - i).times do |j|
          mid_slice = j + 1
          mid_name = @str.slice(first_slice, mid_slice)

          last_slice = first_slice + mid_slice
          last_name = @str.slice(last_slice...str_size)

          token_array = [first_name]
          token_array << mid_name unless blank?(mid_name)
          token_array << last_name unless blank?(last_name)
          token_arrays << token_array
        end
      end

      token_arrays
    end

    private

    def blank?(token)
      token.nil? || token.empty?
    end
  end
end
