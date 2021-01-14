require_relative 'oystercard'
require_relative 'station'

class Journey

  attr_reader :journeys

  DEFAULT_MINIMUM = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil , exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
    @complete = false
  end

  def start(entry_station = nil)
    @entry_station = entry_station
  end

  def finish(exit_station = nil)
    @exit_station = exit_station
    self
  end

  def complete?
     @complete = true unless @entry_station == nil || @exit_station == nil
  end

  def fare
    complete? ? DEFAULT_MINIMUM : PENALTY_FARE
  end
end



















    # PENALTY_FARE = 6
#     def initialize(entry_station)
#         @entry_station = entry_station
#         @exit_station = nil
#         @completed = false
#     end
# def fare
# PENALTY_FARE if @entry_station == nil
# end

# def complete?
#     @completed if @exit_station == nil
#     @completed = true
# end

# def finish(exit_station)
#     @exit_station = exit_station
# end
# end
