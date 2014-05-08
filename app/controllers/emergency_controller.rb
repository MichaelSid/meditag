class EmergencyController < ApplicationController

  def index
    @user = current_user
    @profile = current_user.profile
  end

  def show
    @user = User.find(params[:id])
  end

  def hey
    @user = User.find_by(id: params[:id])
  end
end
