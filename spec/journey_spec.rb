require 'journey'
describe Journey do

  it 'Can store a list of previous journeys' do
    expect(subject.journeys).to be_empty
  end

  # let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  # it 'Saves a journey' do
  #   subject.touch_in(entry_station)
  #   subject.touch_out(exit_station)
  #   expect(subject.journeys).to include journey
  # end
end