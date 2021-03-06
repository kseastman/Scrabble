require_relative 'scoring'
require_relative 'tile_bag'
module Scrabble
  class Player
    attr_accessor :name, :plays, :total_score, :tiles
    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
      @tiles = []
    end

    def play(word)
      if won?
        return false

      else
        word_check = []
        word_chars = word.upcase.chars
        word_chars.each do |char|
          if !tiles.include?(char.to_sym)
            return false
          else
            word_check << char.to_sym
          end
        end

        plays << word
        score = Scrabble::Scoring.score(word)
        self.total_score += score
        return score
      end
    end

    def draw_tiles(tile_bag)
      tiles_need = 7 - tiles.length
      tiles += tile_bag.draw_tiles(tiles_need)
    end

    def highest_scoring_word
      highest_score_word = Scrabble::Scoring.highest_score_from(plays)
      return highest_score_word
    end

    def highest_word_score
      Scrabble::Scoring.score(highest_scoring_word)
    end

    def won?
      return total_score > 100
    end 
  end
end
