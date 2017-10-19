module GuessWhoNoFuzzy
  class Scorer
    def self.score!(token_arrays, &block)
      scores = []

      token_arrays.each do |token_array|
        scorer = Scorer.new(token_array)
        score = scorer.score!
        yield score, token_array
      end

      scores
    end

    def initialize(token_array)
      @token_array = token_array
    end

    def score!
      score = 0

      @token_array.each do |token|
        score += 1.0 if included_in_names?(token)
      end

      score /= @token_array.length
      score
    end

    private

    def included_in_names?(token)
      names = NamesLoader.names_by_first_letter(token[0])
      names.include?(token)
    end
  end
end
