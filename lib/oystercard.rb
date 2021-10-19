class Oystercard
attr_reader :balance
attr_reader :entry_station
attr_reader :exit_station
CARD_LIMIT = 90
MIN_FARE = 1

  def initialize
    @balance = 0
    @card_limit = CARD_LIMIT
    @min_fare = MIN_FARE
  end

  def top_up(amount)
    raise "Card limit reached #{@card_limit}" if (@balance + amount > @card_limit)
    @balance += amount
  end

  def touch_in(station)
    raise "Not enough funds." if @balance < @min_fare
    @entry_station = station
  end

  def touch_out(station)
    @balance -= @min_fare
    @exit_station = station
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end