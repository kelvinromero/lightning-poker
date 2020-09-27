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
    expect(card(suit: :spaces).suit).to eq(:spaces)
  end

  it "has a rank" do
    expect(card(rank: 4).rank).to eq(4)
  end

  context "comparison" do
    subject { card(suit: :spades, rank: 4) }

    context "against itself" do
      let (:other) { card(suit: :spades, rank: 4) }

      it "is equal" do
        expect(subject).to eq(other)
      end

      it "is hash equal" do
        expect(Set.new([subject, other]).size).to eq(1)
      end
    end

    shared_examples_for "an unequal card" do
      it "is not equal" do
        expect(subject).not_to eq(other)
      end

      it "is not hash equal" do
        expect(Set.new([subject, other]).size).to eq(2)
      end
    end

    context "when different suit" do
      let (:other) { card(suit: :hearts, rank: 4) }

      it_behaves_like "an unequal card"
    end

    context "when different rank" do
      let (:other) { card(suit: :spades, rank: 3) }

      it_behaves_like "an unequal card"
    end
  end

  shared_examples_for "a card ranking higher" do
    it "ranks higher" do
      expect(lower.rank).to be < (higher.rank)
    end
  end

  context "when ranking" do
    context "jack against 10" do
        let (:lower) { card(rank: 10 )}
        let (:higher) { card(rank: :jack )}

        it_behaves_like "a card ranking higher"
    end

    context "queen against jack" do
        let (:lower) { card(rank: :jack )}
        let (:higher) { card(rank: :queen )}

        it_behaves_like "a card ranking higher"
    end

    context "king against queen" do
        let (:lower) { card(rank: :queen )}
        let (:higher) { card(rank: :king )}

        it_behaves_like "a card ranking higher"
    end
  end
end
