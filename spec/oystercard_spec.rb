require 'oystercard'

describe Oystercard do
  let(:station) { double :station }

  it 'Initial blance is zero' do
    # subject {Oystercard.new}
    expect(subject.balance).to eq(0)
  end

it ' Can top up card' do
initial_balance = subject.balance
expect(subject.top_up(1)).to eq(initial_balance + 1)
end

it 'Raise error when card is at maximum amount of £90' do
  subject.top_up(Oystercard::CARD_LIMIT)
  expect{ subject.top_up(1) }.to raise_error("Card limit reached #{Oystercard::CARD_LIMIT}")
end

it 'responds to card in journey' do
  subject.top_up(10)
  subject.touch_in(station)
  expect(subject.in_journey?).to eq(true)
end

it 'responds to touch in' do
  subject.top_up(Oystercard::MIN_FARE)
  expect(subject.touch_in(station)).to eq station
end

it 'responds to touch out' do
  expect(subject.touch_out(station)).to eq(nil)
end

it 'Raises error when card is below min balance. ' do
  expect{subject.touch_in(station)}.to raise_error("Not enough funds.")
end

it 'Deducts charge from balance when touching out' do
  expect{subject.touch_out(station)}.to change{subject.balance}.by(-Oystercard::MIN_FARE)

end

it 'Saves the station touched in at' do
  subject.top_up(10)
  subject.touch_in(station)
  expect(subject.entry_station).to eq station
end

let(:entry_station) { double :station }
let(:exit_station) { double :station }

it 'Saves the station touched out at' do
  subject.top_up(10)
  subject.touch_in(entry_station)
  subject.touch_out(exit_station)
  expect(subject.exit_station).to eq exit_station
end

end