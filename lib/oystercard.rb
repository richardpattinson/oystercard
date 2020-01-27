class Oystercard
    attr_reader :balance, :en_route, :entry_station
    MAXIMUM_BALANCE = 90
    MINIMUM_FARE = 1

    def initialize(balance = 0)
        @balance = balance
        @entry_station = nil
    end

    def top_up(value)
        fail "Maximum balance of £#{MAXIMUM_BALANCE} exceeded" if (@balance + value) > MAXIMUM_BALANCE
        @balance += value
    end

    def touch_in(station)
        fail "£#{MINIMUM_FARE} required to touch in" if @balance < MINIMUM_FARE
        @entry_station = station

    end

    def touch_out
        deduct(MINIMUM_FARE)
        @entry_station = nil
    end

    def in_journey?
        @entry_station != nil
    end

    private

    def deduct(value)
        @balance -= value
    end
end
