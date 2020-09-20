require "card.rb"

# What you right here, should be relatively close to what you speak
describe "a playing card" do
  def card(params = {})
    defaults = {
      suit: :hearts,
      rank: 7,
    }

    card(**defaults.merge(params))
  end

  it "has a suit" do
    raise unless card(suit: :spaces).suit == :spaces
  end

  it "has a rank" do
    raise unless card(rank: 4).rank == 4
  end

  # One thing about this specific example:
  # We could test the exact value, but we should rather test the desired behavior
  # For instance ranking higher or lower.
  # The lesson talks about writing for confidence, not proof.
  # one branch / spec (what does that mean?)
  describe "a jack" do
    it "ranks higher than a 10" do
      lower = card(rank: 10)
      higher = card(rank: :jack)

      raise unless lower.rank < higher.rank
    end
  end

  describe "a quen" do
    it "ranks higher than a jack" do
      lower = card(rank: :jack)
      higher = card(rank: :queen)

      raise unless lower.rank < higher.rank
    end
  end

  describe "a king" do
    it "ranks higher than a queen" do
      lower = card(rank: :queen)
      higher = card(rank: :king)

      raise unless lower.rank < higher.rank
    end
  end
end
