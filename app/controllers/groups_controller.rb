class GroupsController < ApplicationController
    before_action :current_group, only: [:edit, :update, :show, :destroy]

    def index
        @groups = Group.all
    end
    
    def new
        @group = Group.new
        @user = current_user
    end

    def create
        @group = Group.create(group_params)
        redirect_to group_path(@group)
    end

    def edit
        @user = current_user
    end

    def update
        @group.update(group_params)
        redirect_to group_path(@group)
    end

    def destroy
        @group.destroy
        redirect_to groups_path
    end

    def show 
        @membership = Membership.new 
    end 

    private

    def group_params
        params.require(:group).permit(:name, :description, :creator_id)
    end

    def current_group
        @group = Group.find(params[:id])
    end

end
