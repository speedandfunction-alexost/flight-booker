class BookingsController < ApplicationController
  def new
  	@flight = Flight.find(params[:flight_id])
  	@booking = @flight.bookings.build
  	@num_passengers = params[:num_passengers]
	@num_passengers.to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(flight_id: booking_params[:flight_id])
    if @booking.save
      booking_params[:passengers_attributes].each do |index, passenger|
        @booking.passengers.create(name: passenger[:name], email: passenger[:email])
        end
      @booking.passengers.each do |passenger|
      PassengerMailer.welcome_email(passenger).deliver_now
      end
      redirect_to booking_path(@booking)
    else
      render 'new'
    end  
  end


  def show
    @booking = Booking.find(params[:id])
  end

    private
    
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email] )
    end
end
