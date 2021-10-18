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

end