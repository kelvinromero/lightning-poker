require "set"
require "card.rb"

# What you right here, should be relatively close to what you speak
describe "a playing card" do
  def card(params = {})
    defaults = {
      suit: :hearts,
      rank: 7,
    }

    Card.build(*defaults.merge(params).values_at(:suit, :rank))
  end

  it "has a suit" do
    raise unless card(suit: :spaces).suit == :spaces
  end

  it "has a rank" do
    raise unless card(rank: 4).rank == 4
  end

  context "comparison" do
    def subject
      @subject ||= card(suit: :spades, rank: 4)
    end

    context "against itself" do
      def other
        @other ||= card(suit: :spades, rank: 4)
      end

      it "is equal" do
        raise unless subject == other
      end

      it "is hash equal" do
        raise unless Set.new([subject, other]).size == 1
      end
    end

    context "when different suit" do
      def other
        @other ||= card(suit: :hearts, rank: 4)
      end

      it "is not equal" do
        raise unless subject != other
      end

      it "is not hash equal" do
        raise unless Set.new([subject, other]).size == 2
      end
    end

    context "when different rank" do
        def other 
            @other = card(suit: :spades, rank: 3)
        end
        it "is not equal to card of different rank" do
            raise unless subject != other
          end
      
          it "is not hash equal to card of different rank" do
            raise unless Set.new([subject, other]).size == 2
          end
    end
    
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
