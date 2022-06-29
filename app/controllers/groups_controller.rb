class GroupsController < ApplicationController
  def index
    authorize!(:read)

    @posts = Post.all
    render(json: @posts)
  end

  def show
   
  end

  def create
   
  end

  def update
   
  end

  def destroy
  
  end

end
