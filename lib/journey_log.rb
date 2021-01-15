require_relative 'oystercard'
require_relative 'journey'

class JourneyLog
  def initialize(journey_class: )
    @journey_class = journey_class
    @journeys = []
  end

  def journeys
    @journeys.dup
  end

end
