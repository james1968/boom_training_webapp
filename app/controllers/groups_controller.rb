class GroupsController < ApplicationController

  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @groups = Group.all
  end

  def show
    @group = set_group
  end

  def new
    @group = Group.new params[:group] ? group_params : {}
  end

  def edit
  end

  def join_group
    !current_user.belongs_to_group(Group.find(params[:id])) ?  membership = Membership.new(group_id: params[:id], user_id: current_user.id) : membership = Membership.new
    
    if membership.save
      flash[:notice] = "Successfully joined the group"
    else
      flash[:notice] = "Failed to join group"
    end
    redirect_to groups_path
  end

  def join_group_update
    @group = Group.find(params[:id])
    @group.update(group_params)
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'User successfully added to group' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :description, :members)
    end
end
