class TasksController < ApplicationController
  def new
    @users = User.all - @board.users
    @task = @board.lists.new
  end
end
