require_relative 'oystercard'
require_relative 'station'
class Journey 
    DEFAULT_MINIMUM = 1
    PENALTY_FARE = 6
   def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station 
    @exit_station = exit_station
   end 
   def start(entry_station)
    @entry_station = entry_station
   end 

   def finish(exit_station)
    @exit_station = exit_station
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