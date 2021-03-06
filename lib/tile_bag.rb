module Scrabble
  class TileBag
    attr_reader :all_tiles, :tiles_remaining
    def initialize
      @all_tiles = create_tiles
      @tiles_remaining = all_tiles
    end

    def create_tiles
      tiles = []
      letter_quantity = {
        A: 9,  N: 6,
        B: 2,  O: 8,
        C: 2,	P: 2,
        D: 4,	Q: 1,
        E: 12, R: 6,
        F: 2,	S: 4,
        G: 3,	T: 6,
        H: 2,	U: 4,
        I: 9,	V: 2,
        J: 1,	W: 2,
        K: 1,	X: 1,
        L: 4,	Y: 2,
        M: 2,	Z: 1
      }

      letter_quantity.each do |letter, quantity|
        quantity.times do
          tiles << Scrabble::Tile.new(letter)
        end
      end

      return tiles
    end

    def draw_tiles(num)
      tiles_picked = []

      if tiles_remaining.size < num
        num = tiles_remaining.size
      end

      num.times do
        some_tile = tiles_remaining.sample
        tiles_picked << some_tile.letter
        tiles_remaining.delete(some_tile)
      end

      return tiles_picked
    end

  end

  class Tile
    attr_reader :letter
    def initialize(letter)
      @letter = letter
    end
  end

end
