class Api::V1::MoviesController < ApplicationController
	def create
		# binding.pry
		@movie = Movie.new(movies_params)
		if @movie.save
			render json:{message:"successfully created",data:@movie,status_code:201}
		else
			render json:{message:"Failed to Create",data:@movie.errors,status_code:422}
		end

	end

	def show
		# binding.pry
		@movie = Movie.find_by_title(params[:title])
		render json:{message:"movie found",data:@movie,status_code:201}
	end

	def update
		@movie=Movie.find_by_id(params[:id])
		if @movie.update_attributes(movies_params)
			render json:{message:"successfully updated",data:@movie,status_code:201}
		else
			render json:{message:"failed to updated",data:@movie.errors,status_code:422}
		end
	end

	def destroy
		# binding.pry
		@movie = Movie.find_by_id(params[:id])
		if @movie.destroy
			render json:{message:"successfully deleted",data:@movie,status_code:201}
		else
			render json:{message:"failed to deleted",data:@movie,status_code:422}
		end
	end

	private
	def movies_params
		params.require(:movie).permit(:title,:year,:rating,:language,:actors,:director,:producer)
	end
end