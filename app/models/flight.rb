class Flight < ApplicationRecord
	  belongs_to :from_airport, class_name: 'Airport', foreign_key: 'from_id'
	  belongs_to :to_airport, class_name: 'Airport', foreign_key: 'to_id'

	  has_many :bookings

	def self.search(params)
      self.where(from_id: params[:from], to_id: params[:to])
	end
end
