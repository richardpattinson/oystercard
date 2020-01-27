class Oystercard
    attr_reader :balance, :en_route
    MAXIMUM_BALANCE = 90
    MINIMUM_FARE = 1
    def initialize
        @balance = 0
        @en_route = false
    end
    def top_up(value)
        fail "Maximum balance of £#{MAXIMUM_BALANCE} exceeded" if (@balance + value) > MAXIMUM_BALANCE
        @balance += value
    end
    def deduct(value)
        @balance -= value
    end
    def touch_in
        fail "£#{MINIMUM_FARE} required to touch in" if @balance < MINIMUM_FARE
        @en_route = true
    end
    def touch_out
        @en_route = false
    end
    def in_journey?
        @en_route
    end
end
