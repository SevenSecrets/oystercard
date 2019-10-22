require 'station'

describe Station do
  it "should tell you the zone when asked" do
    expect(subject.zone).to eq 3
  end

  it "should tell you the station name when asked" do
    expect(subject.name).to eq "Aldgate East"
  end
end
