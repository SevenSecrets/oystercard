require "oystercard"

describe Oystercard do
  let(:origin) { double(:origin) }
  let(:destination) { double(:destination) }

  it "checks instance of oystercard has a balance" do
    expect(subject.balance).to eq 0
  end



    context "top up tests" do
      it "lets you top up the balance" do
        expect{ subject.top_up(1) }.to change { subject.balance }.by(1)
      end

      it "won't let you top up to more than 90" do
        expect { subject.top_up(91) }.to raise_error "Maximum balance of #{subject.max_balance} exceeded"
      end
    end


    context "deduction tests" do

      it "deducts money when touching out" do
        expect { subject.touch_out(destination) }.to change { subject.balance }.by(-1)
      end

    end

    context "travelling tests" do
      it "knows when the passenger is in transit" do
        expect(subject.in_journey?).to eq nil
      end

      it "confirms passenger has touched in" do
        subject.top_up(1)
        subject.touch_in(origin)
        expect(subject.in_journey?).to eq true
      end

      it "confirms passenger has touched out" do
        subject.touch_out(destination)
        expect(subject.in_journey?).to eq nil
      end
    end



    context "insufficient funds tests" do
      it "raises an error if you have insufficient funds" do
        expect { subject.touch_in(origin) }.to raise_error "insufficient funds"
      end
    end



    context "entry stations" do
        before (:each) do
        subject.top_up(1)
        subject.touch_in(origin)
      end
      it "card remembers entry station after touch in" do
        expect(subject.entry_station).to eq origin
      end

      it "card forgets entry station after touch out" do
        subject.touch_out(destination)
        expect(subject.entry_station).to eq nil
      end

      it "records origin station on touch_out" do
        subject.touch_out(destination)
        expect(subject.last_journey).to include(:origin)
      end

      it "records destination station on touch_out" do
        subject.touch_out(destination)
        expect(subject.last_journey).to include(:destination)
    end
  end
end
