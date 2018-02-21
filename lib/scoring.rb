require 'pry'


module Scrabble
  class Scoring
    def self.letter_score(letter)
      score = 0
      case letter
      when  'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'
        score += 1
      when 'D', 'G'
        score += 2
      when 'B', 'C', 'M', 'P'
        score +=	3
      when 'F', 'H', 'V', 'W', 'Y'
        score += 4
      when 'K'
        score +=	5
      when 'J', 'X'
        score +=	8
      when 'Q', 'Z'
        score += 10
        # else
        #   score = nil
      end
      return score
    end

    # def is_a_letter?(input)
    #   input =~ /[A-Z]/
    # end

    def self.score(word)
      score = 0

      letters_in_word = word.upcase.split(//)

      score += 50 if letters_in_word.length == 7

      return nil if
      letters_in_word.length > 7 ||
      letters_in_word.length == 0

      letters_in_word.each do |letter|
        if !(letter =~ /[A-Z]/)
          return nil
        end
        score += letter_score(letter)
      end
      return score
    end

    def self.highest_score_from(array_of_words)

      if array_of_words.length <= 0
        return nil
      elsif array_of_words.length == 1
        return array_of_words[0]
      end

      word_score = {}
      array_of_words.each do |word|
        word_score[word] = score(word)
      end

      max_keys = []
      word_score.each do |key, value|
        if value == word_score.values.max
          max_keys << key
        end
      end

      if max_keys.length == 1
        return word_score.key(word_score.values.max)
      else
        tie_winner(max_keys)
      end

    end # method self.highest_score_from ends

    def self.tie_winner(words)
      word_length = {}
      words.each do |word|
        word_length[word] = word.length
      end

      return word_length.key(word_length.values.min)
    end

  end # class Scoring ends

end # module Scrabble ends


# Scrabble::Scoring.score('cat') #dan example
# binding.pry
