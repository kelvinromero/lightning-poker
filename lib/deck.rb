require 'card'

class Deck
    RANKS = (7..10).to_a + [:jack, :queen, :king, :ace]
    SUITS = [:hearts, :clubs, :diamonds, :spades]

    def self.all
        SUITS.product(RANKS).map do |suit, rank|
            Card.build(suit, rank)
        end
    end
end