class ConditionsController < ApplicationController

	before_action :authenticate_user!, except: [:show]

	def index
		@conditions = Condition.all
	end

	def new
		authenticate_user!
		current_user.conditions.new if current_user.conditions.none?
	end

	# def create
	# 	@condition = Condition.new(condition_params)
	# 	@condition.user = current_user


 #    if @condition.save
 #      redirect_to "/conditions"
 #    else
 #      render 'new'
 #    end
	# end

 #   if @condition.save
 #     redirect_to "/conditions"
 #   else
 #     render 'new'
 #   end
 #   
 #  end

	# def show
	# 	@condition = current_user.conditions.find params[:id]
	# end

	# def destroy
	# 	@condition = current_user.conditions.find params[:id]
	# 	@condition.destroy

	# 	flash[:notice] = 'Condition deleted successfully!'
	# 	redirect_to '/conditions'
	# end

	# def edit
	# 	@condition = current_user.conditions.find params[:id]
	# end

	# def update
	# 	@condition = current_user.conditions.find params[:id]
	# 	@condition.update condition_params
	# 	flash[:notice] = 'Condition updated successfully!'
	# 	redirect_to '/conditions'
	# end

	# private

	# def condition_params
	# 	params[:condition].permit(:condition, :notes)
	# end

end

