require 'journey'

describe Journey do
    let(:station) { double :station, zone: 1}
    let(:subject) { described_class.new(entry_station: station) }
    let(:exit_station) { double :exit_station }

    context 'given an entry station' do
      it {is_expected.to respond_to(:start).with(1).argument}

      it 'has an entry station' do
        expect(subject.start(station)).to eq station
      end
    end

    context 'given an exit station' do
      it {is_expected.to respond_to(:finish).with(1).argument}

      it 'should complete the journey' do
        subject.finish(exit_station)
        expect(subject).to be_complete
      end

      it 'should return the journey' do
        subject.finish(exit_station)
        expect(subject).to eq subject
      end

      it 'should charge the minimum fare' do
        subject.finish(exit_station)
        expect(subject.fare).to eq Journey::DEFAULT_MINIMUM
      end
    end

    context 'if not given an exit station' do
      it 'should charge the penalty fare' do
        expect(subject.fare).to eq Journey::PENALTY_FARE
      end
    end
end
