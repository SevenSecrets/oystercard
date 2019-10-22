require 'journey'

describe Journey do
  let (:oyster) { double(:oyster) }
  let (:destination) { double(:destination) }

  it "records origin station" do
    subject.journey_history(destination)
    expect(subject.last_journey[:origin]).to eq "Aldgate East"
  end

  it "records destination station" do
    subject.journey_history(destination)
    expect(subject.last_journey).to include(:destination)
  end
end
