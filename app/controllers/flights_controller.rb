class FlightsController < ApplicationController
  def index
  	 @allflights = Flight.all
  	 @flights = Flight.search(params)
  	 @airports = Airport.all.map{|a| [ a.city, a.id ] }
  	 @passengers = (1..5).map { |p| [ p.to_s + " passengers", p] }
  end
end
