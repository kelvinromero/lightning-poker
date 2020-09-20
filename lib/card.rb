class Card
  def self.build(suit, rank)
    new(suit: suit, rank: rank)
  end
  private_class_method :new

  def initialize(suit:, rank:)
    @suit = suit
    @rank = case rank
      when :jack then 11
      when :queen then 12
      when :king then 13
      else rank
      end
  end

  def suit
    @suit
  end

  def rank
    @rank
  end

  def ==(other)
    rank == other.rank and suit == other.suit
  end

  def hash
    [suit, rank].hash
  end

  def eql?(other)
    self == other
  end
end