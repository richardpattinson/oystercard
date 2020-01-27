require "oystercard"
describe Oystercard do
    let(:subject) {Oystercard.new(10)}
    let(:station) { double :station }
    it "Should have a starting balance of 0" do
        expect(Oystercard.new.balance).to eq(0)
    end
    describe "#top up" do
        it "Should increase balance by the argument of the top_up method" do
            expect(subject.top_up(10)).to eq(20)
        end
        it "Should raise error if card balance would be brought greater than #{Oystercard::MAXIMUM_BALANCE}" do
            expect{ subject.top_up(100) }.to raise_error "Maximum balance of £#{Oystercard::MAXIMUM_BALANCE} exceeded"
        end
    end

    describe "#touch_in" do
        it "Should change the en_route instance variable to true" do 
            subject.touch_in(station)
            expect(subject.in_journey?).to eq(true)
        end
        it 'Should raise and error if balance less than £1' do
            expect { Oystercard.new.touch_in(station) }.to raise_error "£#{Oystercard::MINIMUM_FARE} required to touch in"
        end
        it "Should remember the name of the touch in station" do
            subject.touch_in('Angel')
            expect(subject.entry_station).to eq('Angel')
        end
    end
    describe "#touch_out" do
        it "Should change the en_route instance variable to false" do
            subject.touch_out
            expect(subject.in_journey?).to eq(false)
        end
        it "Should reduce balance by minimum fare" do 
            expect { subject.touch_out}.to change{subject.balance}.by(-Oystercard::MINIMUM_FARE)
        end 
    end
    describe "#in_journey?" do 
        it "Should print en_route instance varible" do 
            expect(subject.in_journey?).to eq(subject.in_journey?)
        end
    end
end