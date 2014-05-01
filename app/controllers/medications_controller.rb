class MedicationsController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  def index
    flash[:notice] = "hello!"
    @medications = current_user.medications.all
  end

  def new
    flash[:notice] = "hello!"
    authenticate_user!
    
    current_user.medications.new if current_user.medications.none?
  end

#   def create
#     @medication = Medication.new(new_medication_params)
#     @medication.user = current_user

#     if @medication.save
#       render 'new'
#     else
#       render 'new'
#       flash[:notice] = "Fill in all fields!"
#     end
#   end

#   def destroy
#     @medication = Medication.find(params[:id])
#     @medication.destroy

#     flash[:notice] = 'Medication deleted successfully!'
#     redirect_to new_medication_path
#   end



#   private

#   def new_medication_params
#     params[:medication].permit(
#       :medication,
#       :dose)
#   end
end


