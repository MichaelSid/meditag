class MessagesController < ApplicationController

	def create
		@twilio_client = Twilio::REST::Client.new("AC4620e24bb497c7a898fa2f064c3bd745", "3856c5a1cfe83df6265b496c89c9e3d1")

		@twilio_client.account.messages.create(to: "#{current_user.emergencycontact.contactnr}", from: "+442033228019", body: "#{current_user.profile.firstname} #{current_user.profile.lastname}'s medicode was accessed")
		
		flash[:message] = 'Text sent!'
		redirect_to "/emergency/#{current_user.id}"
	end


end


