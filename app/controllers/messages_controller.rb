class MessagesController < ApplicationController

	def create
		@twilio_client = Twilio::REST::Client.new(Rails.application.secrets.twilio_sid, Rails.application.secrets.twilio_tkn)

		@twilio_client.account.messages.create(to: "#{current_user.emergencycontact.contactnr}", from: Rails.application.secrets.twilio_num, body: "#{current_user.profile.firstname} #{current_user.profile.lastname}'s medicode was accessed")
		
		flash[:notice] = 'Text sent!'
		redirect_to "/emergency/#{current_user.id}"
	end


end



