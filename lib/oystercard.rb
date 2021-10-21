class Oystercard
attr_reader :balance
attr_reader :entry_station
attr_reader :exit_station
CARD_LIMIT = 90
MIN_FARE = 1

  def initialize
    @balance = 0
   
  end

  def top_up(amount)
    raise "Card limit reached #{CARD_LIMIT}" if (@balance + amount > CARD_LIMIT)
    @balance += amount
  end

  def touch_in(station)
    raise "Not enough funds." if @balance < MIN_FARE
    @entry_station = station
  end

  def touch_out(station)
    @balance -= MIN_FARE
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