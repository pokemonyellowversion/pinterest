class BoardsController < ApplicationController
	before_action :set_board, only: [:show, :edit, :update, :destroy]
	before_action :authorize, except: [:index, :show]

	def index
		@boards = Board.all
	end

	def show
		@board = Board.find(params[:id])
	end

	def new
		@board = Board.new
	end

	def edit
	end

	def create
		@board = Board.new(board_params)
			if @board.save
				redirect_to boards_path
			else
				render :new
			end

	end

	def update
		if @board.update_attributes(board_params)
			redirect_to boards_path
		else
			render :edit
		end
	end

	def destroy
		@board.destroy
		redirect_to boards_path
	end

	private
		def set_board
			@board = Board.find(params[:id])
		end

		def board_params
			params.require(:board).permit(:name)
		end

end