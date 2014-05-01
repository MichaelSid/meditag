class GpdetailsController < ApplicationController

# before_action :authenticate_user!

def new
	@gpdetail = Gpdetail.new
end


def edit
	@gpdetail = current_user.gpdetail || Gpdetail.new(user: current_user)
end

def create
    @gpdetail = Gpdetail.new(new_gpdetail_params)
    @gpdetail.user = current_user

    if @gpdetail.save
      flash[:notice] = "Success"
      redirect_to "/gpdetail/edit"
    else
      render 'update'
    end
  end

def update
    @gpdetail = current_user.gpdetail

    if @gpdetail.update(new_gpdetail_params)
      flash[:notice] = 'Updated successfully'
      redirect_to "/gpdetail/edit"
    else
      render 'update'
    end
  end



private

def  new_gpdetail_params
	params[:gpdetail].permit(
		:firstname,
    :lastname,
    :faxnumber,
    :contactnr,
    :address1,
    :address2,
    :town,
    :county,
    :country,
    :postcode)
	end
end