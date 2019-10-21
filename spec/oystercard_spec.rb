require "oystercard"

describe Oystercard do

  card = Oystercard.new

  it "checks instance of oystercard has a balance" do
    expect(card.balance).to eq 0
  end


  describe Oystercard.new do

    context "top up tests" do
      it "lets you top up the balance" do
        expect{ subject.top_up(1) }.to change { subject.balance }.by(1)
      end

      it "won't let you top up to more than 90" do
        expect { subject.top_up(90) }.to raise_error "Maximum balance of #{subject.max_balance} exceeded"
      end
    end
  end

  describe Oystercard.new do

    context "deduction tests" do
      it "deducts money when you use it" do
        expect{ subject.deduct }.to change { subject.balance }.by(-1)
      end
    end 
  end

  describe Oystercard.new do

    context "travelling tests" do
      it "knows when the passenger is in transit" do
        expect(subject.in_journey?).to eq false
      end

      it "confirms passenger has touched in" do
        subject.top_up(1)
        subject.touch_in
        expect(subject.in_journey?).to eq true
      end

      it "confirms passenger has touched out" do
        subject.touch_out
        expect(subject.in_journey?).to eq false
      end
    end
  end

  describe Oystercard.new do

    context "insufficient funds tests" do
      it "raises an error if you have insufficient funds" do
        expect { subject.touch_in }.to raise_error "insufficient funds"
      end
    end
  end

end
