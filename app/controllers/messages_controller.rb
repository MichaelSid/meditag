class MessagesController < ApplicationController

	def create
    @user = User.find(params[:user_id])

		@twilio_client = Twilio::REST::Client.new(Rails.application.secrets.twilio_sid, Rails.application.secrets.twilio_tkn)

		@twilio_client.account.messages.create(to: "#{@user.emergencycontact.contactnr}", from: Rails.application.secrets.twilio_num, body: "#{@user.profile.firstname} #{@user.profile.lastname}'s medicode was accessed")
		
		flash[:notice] = 'Text sent!'
		redirect_to "/emergency/#{@user.id}"
	end


end



