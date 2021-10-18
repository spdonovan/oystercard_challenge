class Oystercard
attr_reader :balance
attr_reader :in_journey
CARD_LIMIT = 90
MIN_JOURNEY = 1

  def initialize
    @balance = 0
    @card_limit = CARD_LIMIT
    @in_journey = false
    @min_journey = MIN_JOURNEY
  end

  def top_up(amount)
    raise "Card limit reached #{@card_limit}" if (@balance + amount > @card_limit)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "Not enough funds." if @balance < @min_journey
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end