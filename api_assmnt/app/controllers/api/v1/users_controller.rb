class Api::V1::UsersController < ApplicationController
	def create
		binding.pry
		@user = User.new(users_params)
		if @user.save
			render json:{message:"successfully created",data:@user,status_code:201}
		else
			render json:{message:"Failed to Create",data:@user.errors,status_code:422}
		end

	end

	def show
		@user = User.find_by_name(params[:name])
		render json:{message:"user found",data:@user,status_code:201}
	end

	def update
		@user=User.find_by_id(params[:id])
		if @user.update_attributes(users_params)
			render json:{message:"successfully updated",data:@user,status_code:201}
		else
			render json:{message:"failed to updated",data:@user.errors,status_code:422}
		end
	end

	private
	def users_params
		params.require(:user).permit(:name,:age,:role,:gender)
	end
end