class ListsController < ApplicationController
  before_action :set_board

  def index
    @specialized = @board.lists.where(role: 'specialist')
    @advanced = @board.lists.where(role: 'advanced')
    @anyone = @board.lists.where(role: 'anyone')
  end

  def new
    @list = @board.lists.new
  end

  def create
    @list = @board.lists.new(list_params)
    if @listt.save
      redirect_to board_lists_path(@board)
    else
      render :new
    end
  end

  def destroy
    @list = @board.lists.find(params[:id])
    @list.destroy
    redirect_to board_lists_path(@board)
  end

 private
   def set_board
     @board = board.find(params[:board_id]) 
   end

   def list_params
     params.require(:list).permit(:role, :user_id)
   end
end
