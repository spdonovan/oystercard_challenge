class Oystercard
attr_reader :balance
CARD_LIMIT = 90

  def initialize
    @balance = 0
    @card_limit = CARD_LIMIT
  end

  def top_up(amount)
    raise "Card limit reached #{@card_limit}" if (@balance + amount > @card_limit)
    @balance += amount
  end

end