class ProfilesController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(new_profile_params)
    @profile.user = current_user

    if @profile.save
      # Add uuid to user column here
      flash[:notice] = "Success"
      redirect_to "/profile/edit"
    else
      render 'update'
    end
  end

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile || Profile.new(user: current_user)
  end

  def update
    @profile = current_user.profile

    if @profile.update(new_profile_params)
      flash[:notice] = 'Profile updated successfully'
      redirect_to "/profile/edit"
    else
      render 'update'
    end
  end

  private

  def new_profile_params
    params[:profile].permit(
      :firstname,
      :lastname,
      :dob,
      :contactnr,
      :address1,
      :address2,
      :town,
      :county,
      :country,
      :postcode,
      :gender,
      :image)
  end

end


