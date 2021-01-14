require 'journey'

describe Journey do 
    let(:station) { double :station, zone: 1}
    let(:subject) { described_class.new }
    
    it {is_expected.to respond_to(:start).with(1).argument}
    it {is_expected.to respond_to(:finish).with(1).argument}
end
#     it "has a penalty fare by default" do
#     expect(subject.fare).to eq Journey::PENALTY_FARE
#     end
# describe '#complete?' do
#     it "it know if a journey is complete" do 
#         subject.complete? 
#         expect(subject).to be_complete
#     end
#     it "knows if a journey is not complete" do 
#         expect(subject).not_to be_complete 
#     end 
# end
