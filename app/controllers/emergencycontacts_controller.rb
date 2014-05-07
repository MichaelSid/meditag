class EmergencycontactsController < ApplicationController
 before_action :authenticate_user!, except: [:show]

def new
	@emergencycontact = Emergencycontact.new
end


def edit
	@emergencycontact = current_user.emergencycontact || Emergencycontact.new(user: current_user)
end

def create
    @emergencycontact = Emergencycontact.new(new_emergencycontact_params)
    @emergencycontact.user = current_user

    if @emergencycontact.save
      flash[:notice] = "Success"
      redirect_to "/emergencycontact/edit"
    else
      render 'update'
    end
  end

def update
    @emergencycontact = current_user.emergencycontact

    if @emergencycontact.update(new_emergencycontact_params)
      flash[:notice] = 'Updated successfully'
      redirect_to "/emergencycontact/edit"
    else
      render 'update'
    end
  end

private

def  new_emergencycontact_params
	params[:emergencycontact].permit(
		:firstname,
    :lastname,
    :relationship,
    :contactnr,
    :address1,
    :address2,
    :town,
    :county,
    :country,
    :postcode)
	end
end