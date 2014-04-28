class ProfileController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(new_profile_params)

    if @profile.save
      redirect_to '/profile/#{user_id}'
    else
      render 'new'
    end
  end

  def show
    @profile = Profile.find params[:id]
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


