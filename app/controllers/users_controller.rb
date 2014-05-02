class UsersController < ApplicationController

	def update
		authenticate_user!
		if current_user.update!(user_params)
			redirect_to :back
		end
	end

	private

	def user_params
		params[:user].permit(medications_attributes: [:id, :medication, :dose, :emergency, :_destroy], conditions_attributes: [:id, :condition, :notes, :emergency, :_destroy])
	end
end
