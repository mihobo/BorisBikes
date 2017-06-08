require 'DockingStation.rb'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect{subject.release_bike}.to raise_error("There are no more bikes available")
    end

    it 'gets a bike' do
      subject.dock(Bike.new)
      bike = subject.release_bike
        expect(bike).to be_a_kind_of(Bike)
        expect(bike).to be_working
    end
  end

  describe '#dock' do
    it 'raises an error when the docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect{subject.dock Bike.new}.to raise_error("The docking station is full")
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq subject.bikes.last
    end
  end
end
