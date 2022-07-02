class GroupsController < ApplicationController
  def index
    authorize!(:read)
    @groups = Group.where(:host_id => @current_user.id)
    render(json: { data: @groups, code: 0 })
  end

  def add_member
    authorize!(:read)
    params.require([:group_id, :user_email])
    group = Group.find(params[:group_id])
    if group.host_id.to_s != @current_user.id.to_s
      render(json: { error: "Unauthorized" }, status: 401)
      return
    end
    member = User.where(email: params[:user_email])
    if member.nil?
      member = User.create!(email: params[:user_email], password: "0", is_linked: false)
      member.save
    end
    user_group_ref = UserGroupRef.new(user_id: member.first.id, group_id: group.id)
    user_group_ref.save
    render(json: { data: "success", code: 0 })
  end

  def list_member
    authorize!(:read)
    params.require([:group_id])
    count_members = Group.joins(:user).where(group_id: params[:group_id])
    render(json: { data: [], code: 0, count: count_members })
  end

  def show
    authorize!(:read)
    group = Group.find(params[:id])
    count_members = UserGroupRef.where(group_id: group.id).count(:id)
    render(json: { data: group, code: 0, count: count_members })
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
end
