require 'oystercard'

describe Oystercard do
  it 'Initial blance is zero' do
    # subject {Oystercard.new}
    expect(subject.balance).to eq(0)
  end

end