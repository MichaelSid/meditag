class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(new_profile_params)
    @profile.user = current_user

    if @profile.save
      redirect_to "/profile"
    else
      render 'new'
    end
  end

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile

    if @profile.update(new_profile_params)
      redirect_to "/profile"
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
      :gender)
  end

end


