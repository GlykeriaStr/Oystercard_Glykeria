require 'oystercard'
require 'journey'

describe Oystercard do
  let(:station){ double :station }
  let(:exit_station){double :exit_station}
  let(:journey) { { entry_station: station, exit_station: exit_station } }
  let(:journey_class_double) { double :journey_class }

  describe '#balance' do
    it 'starts with a balance of 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top up' do
    it 'checks if the oystercard responds to the top_up method' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it 'Adds money to balance' do
      expect{ subject.top_up(50) }.to change{ subject.balance }.by 50
    end

    it 'Raises an error when exceeds the card limit' do
      default_limit = Oystercard::DEFAULT_LIMIT
      subject.top_up(default_limit)
      expect{ subject.top_up 1 }.to raise_error "It exceeds the #{default_limit} limit."
    end
  end

  describe '#deduct' do
    it 'deducts money from balance' do
      subject.top_up(20)
      expect{ subject.send(:deduct, 20) }.to change{ subject.balance }.by -20
    end
  end

  describe '#in_journey?' do
    it 'starts off not in journey' do
      expect(subject).not_to be_in_journey
    end

    it 'should check if card is in_journey' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end
  end

  describe '#touch_in' do
    #Commented this out because if they don't touch out doesn't mean they are still in journey
    # it 'tells us that the card is in journey' do
    #   subject.top_up(10)
    #   subject.touch_in(station)
    #   expect(subject).to be_in_journey
    # end

    it 'raises an error when the user has insufficient funds' do
      expect(subject.balance).to eq 0
      expect { subject.touch_in(station) }.to raise_error "Insufficient funds"
    end
  end

  describe '#touch_out' do
    it 'tells us that the card is not in journey' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end

  #   it 'will deduct the cost of the journey' do
  #     subject.top_up(10)
  #     subject.touch_in(station)
  #     expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by (-Journey.new.fare)
  #   end
  end

  describe '#journeys' do
    it 'has an empty list of journeys by default' do
      expect(subject.journeys).to eq []
    end

    it 'will return the station in the journey' do
      subject.journeys << journey_class_double
      expect(subject.journeys).to include journey_class_double
    end
  end
end
