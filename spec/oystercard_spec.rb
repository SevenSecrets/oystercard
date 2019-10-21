require "oystercard"

describe Oystercard do

  card = Oystercard.new

  it "checks instance of oystercard has a balance" do
    expect(card.balance).to eq 0
  end


  describe Oystercard.new do
    it "lets you top up the balance" do
      expect{ subject.top_up(1) }.to change { subject.balance }.by(1)
    end

    it "won't let you top up to more than 90" do
      expect { subject.top_up(90) }.to raise_error "Maximum balance of #{subject.max_balance} exceeded"
    end
  end
end
