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
		@board = Board.find(params[:board_id])
	end

	def edit
	end

	def create
		@board = Board.find(params[:board_id])
		@pin = Pin.new(pin_params)
		@pin.board = @board
		if @pin.save
			redirect_to @board
		else
			render :new
		end
	end

	def update
		if @pin.update_attributes(pin_params)
			redirect_to board_path(@pin.board)
		else
			render :edit
		end
	end

	def destroy
		@pin.destroy
		redirect_to :back
	end

	def all
		@pins = Pin.all
	end

	private
		def set_pin
			@pin = Pin.find(params[:id])
		end

		def pin_params
			params.require(:pin).permit(:description, :image)
		end


end