class GroupsController < ApplicationController
  def index
    authorize!(:read)
    @groups = Group.where(:host_id => @current_user.id)
    render(json: { data: @groups, code: 0 })
  end

  def add_member
    authorize!(:read)
    group = Group.find_by_id(add_member_params[:group_id])
    render(json: { data: group, code: 0 })
  end

  def show
   
  end

  def create
    authorize!(:read)
    @group = Group.new(name: group_params[:name], avatar: group_params[:avatar], 
                        host_id: @current_user.id, total_payments: 0, total_donations: 0)
    @group.save
    render(json: { data: @group, code: 0 })
  end

  def update
   
  end

  def destroy
  
  end

  private
  def group_params
    params.permit(:name, :avatar)
  end
  def add_member_params
    params.require([:group_id, :user_id])
  end
end
