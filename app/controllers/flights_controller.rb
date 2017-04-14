class FlightsController < ApplicationController
  def index
  	@flights = Flight.search(params)
  	 @airports = Airport.all.map{|a| [ a.city, a.id ] }
  end
end
