class PinsController < ApplicationController
	before_action :set_pin, only: [:show, :edit, :update, :destroy]
	before_action :authorize, except: [:index, :show]
	
	def index
		@pins = Pin.all
	end

	def show
	end

	def new
	end

	def edit
	end

	def create
	end

	def update
	end

	def destroy
	end

	private
		def set_pin
			@pin = Pin.find(params[:id])
		end

		def pin_params
			params.require(:pin).permit(:description)
		end


end