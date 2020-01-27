require "oystercard"
describe Oystercard do
    # let(:subject) {Oystercard.new}
    it "Should have a starting balance of 0" do
        expect(subject.balance).to eq(0)
    end
    describe "#top up" do
        it "Should increase balance by the argument of the top_up method" do
            expect(subject.top_up(10)).to eq(10)
        end
        it "Should raise error if card balance would be brought greater than #{Oystercard::MAXIMUM_BALANCE}" do
            expect{ subject.top_up(100) }.to raise_error "Maximum balance of £#{Oystercard::MAXIMUM_BALANCE} exceeded"
        end
    end
    describe "#deduct" do
        it "Should be able to deduct from the balance by the argument of the deduct method" do
            subject.top_up(60)
            expect(subject.deduct(20)).to eq(40)
        end
    end
    describe "#touch_in" do
        it "Should change the en_route instance variable to true" do
            subject.touch_in
            expect(subject.en_route).to eq(true)
        end
    end
    describe "#touch_out" do
        it "Should change the en_route instance variable to false" do
            subject.touch_out
            expect(subject.en_route).to eq(false)
        end
    end
    describe "#in_journey?" do 
        it "Should print en_route instance varible" do 
            expect(subject.in_journey?).to eq(subject.en_route)
        end
    end
end