class BookingsController < ApplicationController
  def new
  	@flight = Flight.find(params[:flight_id])
  	@booking = @flight.bookings.build
  	@num_passengers = params[:num_passengers]
	@num_passengers.to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create(booking_params)
    redirect_to root_path   
  end


  def show
    @booking = Booking.find(params[:id])
  end

    private
    
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email] )
    end
end
