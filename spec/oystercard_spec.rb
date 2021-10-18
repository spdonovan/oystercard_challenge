require 'oystercard'

describe Oystercard do
  it 'Initial blance is zero' do
    # subject {Oystercard.new}
    expect(subject.balance).to eq(0)
  end

it ' Can top up card' do
initial_balance = subject.balance
expect(subject.top_up(1)).to eq(initial_balance + 1)
end

it 'Can deduct from card' do
initial_balance = subject.balance
expect(subject.deduct(1)).to eq(initial_balance - 1)
end

it 'Raise error when card is at maximum amount of £90' do
  subject.top_up(Oystercard::CARD_LIMIT)
  expect{ subject.top_up(1) }.to raise_error("Card limit reached #{Oystercard::CARD_LIMIT}")
end

it 'responds to card in journey' do
  expect(subject.in_journey).to eq(false)
end

it 'responds to touch in' do
  expect(subject.touch_in).to eq(true)
end

it 'responds to touch out' do
  expect(subject.touch_out).to eq(false)
end
end