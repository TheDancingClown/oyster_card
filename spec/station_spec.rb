require 'station'

describe Station do
    describe "Station's variables"
    subject = Station.new("Kings Cross", 1)
        it "Check station is Kings Cross" do
        expect(subject.name).to eq "Kings Cross" 
        end

        it "Check station zone is 1" do
            expect(subject.zone).to eq 1
        end

end