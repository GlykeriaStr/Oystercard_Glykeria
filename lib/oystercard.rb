require_relative 'journey'

class Oystercard

  attr_reader :balance, :journeys, :current_journey


  DEFAULT_LIMIT = 90
  DEFAULT_MINIMUM = 1

  def initialize
    @balance = 0
    @current_journey = nil
    @journeys = []
  end

  def top_up(amount)
    fail "It exceeds the #{DEFAULT_LIMIT} limit." if amount + balance > DEFAULT_LIMIT
    @balance += amount
  end

  def touch_in(station)
    touch_out(nil) if @current_journey != nil
    fail "Insufficient funds" if balance < DEFAULT_MINIMUM
    @current_journey = Journey.new(station)
  end

  def touch_out(exit_station)
    @journeycurrent_ = Journey.new if @journeycurrent_.nil?
    @current_journey.finish(exit_station)
    end_journey
  end

  def in_journey?
    !@current_journey.nil?
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def end_journey
    deduct( @current_journey.fare )
    @journeys <<  @current_journey
    @current_journey = nil
  end
end
