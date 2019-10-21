require "oystercard"

describe Oystercard do

  card = Oystercard.new

  it "checks instance of oystercard has a balance" do
    expect(card.balance).to eq 0
  end

  it "lets you top up the balance" do
    expect{ card.top_up(1) }.to change { card.balance }.by(1)
  end

end
