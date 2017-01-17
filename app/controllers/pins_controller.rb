class PinsController < ApplicationController
	before_action :set_pin, only: [:show, :edit, :update, :destroy]
	before_action :authorize, except: [:index, :show]
	
	def index
		@pins = Pin.all
	end

	def show
	end

	def new
		@pin = Pin.new
	end

	def edit
	end

	def create
		@pin = Pin.new(pin_params)
			if @pin.save
				redirect_to :back
			else
				render :new
			end
	end

	def update
		if @pin.update_attributes(pin_params)
			redirect_to boards_path
		else
			render :edit
		end
	end

	def destroy
		@pin.destroy
		redirect_to :back
	end

	private
		def set_pin
			@pin = Pin.find(params[:id])
		end

		def pin_params
			params.require(:pin).permit(:description, :image)
		end


end