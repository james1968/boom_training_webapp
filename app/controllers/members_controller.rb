class MembersController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
    @member = Member.new
  end

  def create
    @group = Group.find(params[:group_id])
    @group.members.create(member_params)
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

    private

    def member_params
      params.require(:member).permit(:user_email, :user_name)
    end

end
