require 'journey'
describe Journey do

  it 'Can store a list of previous journeys' do
    expect(subject.journeys).to be_empty
  end
end