class EmergencyController < ApplicationController
  def show
    @user = User.find_by(uuid: params[:id])
  end
end
