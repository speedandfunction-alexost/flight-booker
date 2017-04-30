class PassengerMailer < ApplicationMailer
	 default from: "flights@example.com"

	   def welcome_email(passenger)
	   	@passenger = passenger
	   	@booking = @passenger.booking
    	mail(to: @passenger.email, subject: "Thank you for reservation!")
	  end
end
